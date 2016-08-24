
$(document).ready(function(){
    $.getJSON( "data.json", function(data) {
        importFont(data);
        buildHeader(data);
        buildList(data);
        buildFooter();
    });
})

function importFont(data){
    var font_name = data["name"];
    var file_name = data["filename"];
    $("head").append($('<style>@font-face {font-family:'+font_name+'; src: url('+file_name+');}</style>'));
}

function buildHeader(data){
    var font_name = data["name"];
    var unicodes = data["unicodes"];
    var title = font_name + " Catalog";

    // Document title
    document.title = title;

    // Title and subtitle
    $("body").append($('<div class=title>'+title+'</div>'));
    $("body").append($('<div class=subtitle>'+Object.keys(unicodes).length+' Icons Available</div>'));
}

function buildList(data){
    var font_name = data["name"];
    var unicodes = sortObject(data["unicodes"]);

    var newUl = $('<ul/>');

    // Appends each icon row by row
    for(var key in unicodes){
        var icon = '&#x' + unicodes[key];
        var unicode = '0x' + unicodes[key];

        var newLi = $('<li/>');
        newLi.addClass('icon');
        newLi.append('<div class=icon style=font-family:'+font_name+'>' + icon + '</div>');
        newLi.append('<i>' + key + '</i>');
        newLi.append('<code>' + unicode + '</code>');

        newUl.append(newLi);
    }
    
    $("body").append(newUl);
}

function sortObject(obj) {
    return Object.keys(obj).sort().reduce(function (result, key) {
        result[key] = obj[key];
        return result;
    }, {});
}

function buildFooter(){
    // Footer
    $("body").append($('<div class=footer>Generated using Iconic, by Ignacio Romero Z. — <a href="https://github.com/dzenbot/Iconic">https://github.com/dzenbot/Iconic</a></div>'));
}
