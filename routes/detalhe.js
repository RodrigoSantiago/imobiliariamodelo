var express = require('express');
var router = express.Router();
var pool = require('./database');

/* GET home page. */
router.get('/', function(req, res, next) {

    let id = req.query.id ? req.query.id : 1;
    id = parseInt(id);
    if (isNaN(id) || id < 1) id = 1;


    var queryDetalhe = 'SELECT imoveis.id as id, ' +
        'imoveis.titulo as titulo, ' +
        'imoveis.descricao as descricao, ' +
        'imoveis.endereco as endereco, ' +
        'imoveis.detalhes as detalhes, ' +
        'imoveis.video as video, ' +
        'imoveis.preco as preco, ' +
        'imoveis.lat as lat, ' +
        'imoveis.lon as lon, ' +
        'imoveis.mostraposicao as mostraposicao, ' +
        'imoveis.pisos as pisos, ' +
        'imoveis.banheiros as banheiros, ' +
        'imoveis.salas as salas, ' +
        'imoveis.quartos as quartos, ' +
        'imoveis.suites as suites, ' +
        'imoveis.garagem as garagem, ' +
        'tipos.nome as tipo ' +
        'FROM imoveis ' +
        'LEFT JOIN tipos ON tipos.id = imoveis.id WHERE imoveis.id = ?';


    var queryNews = 'SELECT imoveis.id as id, ' +
        'imoveis.titulo as titulo, ' +
        'imoveis.descricao as descricao, ' +
        '(SELECT nome FROM fotos WHERE fotos.imovel_id = imoveis.id LIMIT 1) as imagem ' +
        'FROM imoveis ' +
        'LIMIT 5';

    var queryFotos = 'SELECT * FROM fotos WHERE imovel_id = ?';
    var queryPlantas = 'SELECT * FROM plantas WHERE imovel_id = ?';
    var imagens = [];
    var plantas = [];

    pool.query(queryNews, function (error, results, fields) {
        if (error) throw error;

        var news = results;
        pool.query(queryFotos, id, function (error, results, fields) {
            for (let i = 0; i < results.length; i++) {
                imagens[i] = results[i].nome;
            }

            pool.query(queryPlantas, id, function (error, results, fields) {
                for (let i = 0; i < results.length; i++) {
                    plantas[i] = results[i].nome;
                }
                pool.query(queryDetalhe, id, function (error, results, fields) {
                    if (error) throw error;

                    res.render('detalhe', {
                        title: 'Express',
                        row: results[0],
                        page: 'detalhe',
                        imagens: imagens,
                        plantas: plantas,
                        news : news
                    });
                });
            });
        });
    });
});

module.exports = router;
