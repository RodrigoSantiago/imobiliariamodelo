var headerSize = 200;
var _GET = {};
var pg;
if (document.location.toString().indexOf('?') !== -1) {
    var query = document.location
        .toString()
        .replace(/^.*?\?/, '')
        .replace(/#.*$/, '')
        .split('&');

    for(var i=0, l=query.length; i<l; i++) {
        var aux = decodeURIComponent(query[i]).split('=');
        _GET[aux[0]] = aux[1];
    }
    pg = _GET['page'];
    if (!pg)
        pg = 0;
}

function search() {
    var val = $('#search_text').val();
    var tags = "";
    var found = false;
    $(".chip:not(.chip-primary).selected").each(function (e) {
        if (found) tags += ", ";
        found = true;
        tags += $(this).text();
    });
    if (found) {
        _GET["tags"] = tags;
    } else {
        delete _GET["tags"];
    }
    if (val === "") {
        delete _GET["texto"];
    } else {
        _GET["texto"] = val;
    }
    delete _GET["page"];
    refresh();
}

function navigate(to) {
    if (to === "-1") {
        _GET["page"] = pg - 1;
    } else if (to === "+1") {
        _GET["page"] = pg + 1;
    } else {
        _GET["page"] = parseInt(to);
    }
    refresh();
}

function refresh() {
    var str = 'imoveis?';
    var first = true;
    for (var key in _GET) {
        if (!_GET.hasOwnProperty(key)) continue;

        var value = _GET[key];
        if (value) {
            if (!first) str += '&';
            first = false;
            str += key + "=" + encodeURIComponent(value);
        }
    }
    window.location.href = first ? "imoveis" : str;
}