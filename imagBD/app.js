const express = require('express')
const multer = require('multer')

const {Pool} = require('pg')

const fs = require('fs')

const app= express()
const port= 3000

const pool = new Pool({
    user:'postgres',
    host:'localhost',
    database:'PROCEDIMIENTOS',
    password:'',
    port:'5432'
})

const upload = multer({dest:'uploads/'})


app.use(express.static('public'))

app.get('/',(req,res)=>{
    res.sendFile(__dirname + '/public/index.html')
})

app.post('/upload', upload.single('image'),async(req,res)=>{
    const {originalname,path} = req.file
    try {
        const imageData = fs.readFileSync(path)
        const result= await pool.query(
            'INSERT INTO imagenes_byte (nombre,imagen) values ($1,$2) RETURNING id'
            [originalname,imageData]
        )

        fs.unlinkSync(path)
        res.send(`Imagen cargada con éxito con ID: ${result.rows[0].id}`)
    } catch (error) {
        console.error(error);
        res.status(500).send('Error al cargar la imagen')
    }
})

app.listen(port, ()=>{
    console.log(`Servidor escuchando en http://localhost:${port}`);
    
})