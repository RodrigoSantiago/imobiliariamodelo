var express = require('express');
var router = express.Router();
var pool = require('./database');

/* GET home page. */
router.get('/', function(req, res, next) {

    let page = req.query.page ? req.query.page : 0;
    page = parseInt(page);
    if (isNaN(page)) page = 0;

    let texto = req.query.texto ? req.query.texto : "";
    let min = parseInt(req.query.min ? req.query.min : "0");
    if (isNaN(min) || min < 0) min = 0;
    let max = parseInt(req.query.max ? req.query.max : "99999");
    if (isNaN(max) || max < 0) max = 99999;


    var queryPages = 'SELECT count(id) as num FROM imoveis';
    var queryImoveis = 'SELECT imoveis.id as id, ' +
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
        '(SELECT nome FROM fotos WHERE fotos.imovel_id = imoveis.id LIMIT 1) as imagem ' +
        'FROM imoveis ' +
        'LIMIT 10 OFFSET ?';

    var queryNews = 'SELECT imoveis.id as id, ' +
        'imoveis.titulo as titulo, ' +
        'imoveis.descricao as descricao, ' +
        '(SELECT nome FROM fotos WHERE fotos.imovel_id = imoveis.id LIMIT 1) as imagem ' +
        'FROM imoveis ' +
        'LIMIT 5';

    pool.query(queryNews, function (error, results, fields) {
        if (error) throw error;

        var news = results;

        pool.query(queryPages, function (error, results, fields) {
            if (error) throw error;

            var found = results[0].num;
            pool.query(queryImoveis, [page * 10], function (error, results, fields) {
                if (error) throw error;

                res.render('imoveis', {title: 'Express', page: 'imoveis', found: found, currentPage : page, rows: results, news : news});
            });
        });
    });
});

module.exports = router;
