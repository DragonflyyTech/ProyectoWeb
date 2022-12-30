const mesano = document.querySelector(".mesano"),
        diasT = document.querySelector(".dias"),
        icon = document.querySelectorAll(".iconos span");


let date = new Date(),
anoAct = date.getFullYear(),
mesAct = date.getMonth();

const meses = ["Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio", "Julio", "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre"];

const MostrarCalendario = () => {
    let primerdiadelmes = new Date(anoAct, mesAct ,1).getDay(),
    ultimodiadelmes = new Date(anoAct, mesAct + 1, 0).getDate(),
    ultimafechadelmes = new Date(anoAct, mesAct , ultimodiadelmes).getDay(),
    ultimodiadelmespasado = new Date(anoAct, mesAct ,0).getDate();
    let lisdiasT = "";

    for (let i = primerdiadelmes; i > 0; i-- ){
        lisdiasT += `<li class="inactivo">${ultimodiadelmespasado-i +1}</li>`;
    }

    for (let i = 1; i <= ultimodiadelmes; i++) {
        let eshoy = i === date.getDate() && mesAct === new Date().getMonth() && anoAct ===new Date().getFullYear() ? "activo":"";
        lisdiasT += `<li class="${eshoy}">${i}</li>`;
    }

    for (let i = ultimafechadelmes; i < 6; i++) {
        lisdiasT += `<li class="inactivo">${i - ultimafechadelmes +1}</li>`;
    }


    mesano.innerText = `${meses[mesAct]} ${anoAct}`;
    diasT.innerHTML = lisdiasT;
};

MostrarCalendario();

icon.forEach(icono => {
    icono.addEventListener("click", () => {
        mesAct = icono.id === "anterior" ? mesAct-1: mesAct+1;

        if (mesAct <0 || mesAct>11) {
            date = new Date(anoAct,mesAct);
            anoAct = date.getFullYear();
            mesAct = date.getMonth();
        }else{
            date = new Date();
        }
        MostrarCalendario();
    });
    
});