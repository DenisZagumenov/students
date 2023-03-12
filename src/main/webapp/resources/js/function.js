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