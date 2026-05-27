const express = require('express');
const router = express.Router();
const veiculosController = require('../controllers/veiculosController');


router.get('/veiculos', veiculosController.listarVeiculos);


router.post('/veiculos', veiculosController.cadastrarVeiculo);

module.exports = router;