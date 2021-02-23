function handleResult(event) {
    const [data] = event.detail

    const result = $('#result');
    result.empty()

    result.append(`<h1>Найденные палиндромы</h>`)

    $('<table></table>')
        .append('<tr><th>Десятичное число</th><th>Двоичное число</th></tr>')
        .append(data.map(a => `<tr><td>${a.dec}</td><td>${a.bin}</td></tr>`))
        .appendTo(result)
}

document.addEventListener('turbolinks:load', () => {
    document.getElementById('form')
        .addEventListener('ajax:success', handleResult)
})
