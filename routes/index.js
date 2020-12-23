var express = require('express');
var router = express.Router();
var pool = require('./database');

/* GET home page. */
router.get('/', function(req, res, next) {

    var queryNews = 'SELECT imoveis.id as id, ' +
        'imoveis.titulo as titulo, ' +
        'imoveis.preco as preco, ' +
        'imoveis.descricao as descricao, ' +
        'imoveis.pisos as pisos, ' +
        'imoveis.banheiros as banheiros, ' +
        'imoveis.salas as salas, ' +
        'imoveis.quartos as quartos, ' +
        'imoveis.suites as suites, ' +
        'imoveis.garagem as garagem, ' +
        '(SELECT nome FROM fotos WHERE fotos.imovel_id = imoveis.id LIMIT 1) as imagem ' +
        'FROM imoveis ' +
        'LIMIT 12';

    pool.query(queryNews, function (error, results, fields) {
        if (error) throw error;

        var news = results;
        res.render('home', { title: 'Express', page : 'home' , news : news});
    });
});

module.exports = router;
