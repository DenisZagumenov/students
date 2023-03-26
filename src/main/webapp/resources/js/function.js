function deleteStudents() {

    const checkedCheckBoxes = document.querySelectorAll("input[name=studentId]:checked");

    if (checkedCheckBoxes.length == 0) {
        alert("Пожалуйста, выберите хотя бы одного студента.");
        return;
    }

    let ids = "";

    for (let i = 0; i < checkedCheckBoxes.length; i++) {
        ids = ids + checkedCheckBoxes[i].value + " ";
    }

    document.getElementById("idsForDelete").value = ids;
    document.getElementById("deleteForm").submit();
}

function modifyStudent() {

    const checkedCheckBoxes = document.querySelectorAll("input[name=studentId]:checked");

    if (checkedCheckBoxes.length == 0) {
        alert("Пожалуйста, выберите одного студента.");
        return;
    }

    if (checkedCheckBoxes.length > 1) {
        alert("Пожалуйста, выберите только одного студента.");
        return;
    }

    let id = checkedCheckBoxes[0].value;

    document.getElementById("idsForModify").value = id;
    document.getElementById("modifyForm").submit();
}

function modifyDiscipline() {

    const checkedCheckBoxes = document.querySelectorAll("input[name=disciplineId]:checked");

    if (checkedCheckBoxes.length == 0) {
        alert("Пожалуйста, выберите дисциплину");
        return;
    }

    if (checkedCheckBoxes.length > 1) {
        alert("Пожалуйста, выберите только одну дисциплину");
        return;
    }

    let id = checkedCheckBoxes[0].value;

    document.getElementById("idsForModifyDiscipline").value = id;
    document.getElementById("modifyFormDiscipline").submit();
}

function deleteDiscipline() {

    const checkedCheckBoxes = document.querySelectorAll("input[name=disciplineId]:checked");

    if (checkedCheckBoxes.length == 0) {
        alert("Пожалуйста, выберите хотя бы одну дисциплину");
        return;
    }

    let ids = "";

    for (let i = 0; i < checkedCheckBoxes.length; i++) {
        ids = ids + checkedCheckBoxes[i].value + " ";
    }

    document.getElementById("idsForDeleteDiscipline").value = ids;
    document.getElementById("deleteFormDiscipline").submit();
}

function studentProgress() {

    const checkedCheckBoxes = document.querySelectorAll("input[name=studentId]:checked");

    if (checkedCheckBoxes.length == 0) {
        alert("Пожалуйста, выберите одного студента.");
        return;
    }

    if (checkedCheckBoxes.length > 1) {
        alert("Пожалуйста, выберите только одного студента.");
        return;
    }

    let id = checkedCheckBoxes[0].value;

    document.getElementById("idsForProgress").value = id;
    document.getElementById("ProgressForm").submit();
}

function createTerm() {

    //получим DOM элемента select по ID
    var elm = document.getElementById("selectedDisciplines");
    //в этот массив будем отбирать выбранные значения
    var values = [];
    //случай мульти-режима
    if (elm.multiple) {
        //перебираем массив опций
        for (var i = 0; i < elm.options.length; i ++) {
            //если опция выбрана - добавим её в массив
            if (elm.options[i].selected)
                values.push(elm.options[i].value);
        }
    //случай одиночного выбора в select
    } else
        values.push(elm.value);

    //выведем результат в консоль
    // console.log(values);

    let duration = document.getElementById('durationDiscipline').value;

    if (isNaN(duration)) {
        alert("Введите только число");
        return;
    }

    if (values.length == 0 || duration.length == 0) {
        alert("Поля не должны быть пустыми");
        return;
    }
    document.getElementById('duration').value = duration;
    document.getElementById("idsSelectedDisciplines").value = values;
    document.getElementById("disciplinesForTerm").submit();
}

function deleteTerm () {

    var term = document.getElementById("selectedTerm");
    var values;

    if (term.options.selected) {
        values = term.options.value;
    } else {
        values = 1;
    }
    document.getElementById("idsSelectedDisciplines").value = values;
    document.getElementById("deleteTerm").submit();

}