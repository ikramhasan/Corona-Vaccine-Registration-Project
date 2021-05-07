const app = require('./app');

const port = process.env.PORT || 5000;

console.log(app.get('env'))

app.listen(port, () => {
    console.log(`Listening on port ${port}`);
});