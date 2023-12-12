<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<html lang="en">
<head>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Comfortaa&family=Dhurjati&display=swap" rel="stylesheet">
    <meta charset="UTF-8">

    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Моя Страница</title>
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/styles.css" />">
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<body>

<div class="card-container">
    <div class="card">
        <img src="resources\pictures\settings.png">

        <button class="button" onclick="openModal('settingsModal')">Наcтройки</button>

    </div>
    <div class="card">
        <img src="resources\pictures\function.png">

        <button class="button" onclick="openModal('creationModal')">Создать TabulatedFunction</button>

    </div>
    <div class="card">

        <img src="resources\pictures\math-book.png">
        <button class="button" onclick="openModal('mathFunctionModal')">Создать MathFunction</button>

    </div>
    <div class="card">

        <img src="resources\pictures\calculators.png">
        <button class="button" onclick="openModal('operationsModal')">Операции с функциями</button>

    </div>
    <div class="card">
        <img src="resources\pictures\dif.png">
        <button class="button" onclick="openModal('differentiationModal')">Дифференцирование функции</button>

    </div>

</div>

<div id="differentiationModal" class="modal">
    <div class="modal-content">
        <span onclick="closeModal('differentiationModal')" style="float: right; cursor: pointer;">&times;</span>
        <h3>Изначальная функция</h3>


        <table id="difFunctionTable" style="width: 100%;">
            <thead>
            <tr>
                <th>X</th>
                <th>Y</th>
            </tr>
            </thead>
            <tbody></tbody>
        </table>

        <div class="button-container1">
            <button class="modal-button1" onclick="openCreationModalFromDif()">Открыть Создание</button>
            <button class="modal-button1" onclick="openMathFunctionModalFromDif()">Открыть MathFunction</button>
            <button class="modal-button1" onclick="openFileInput('diff')">Загрузить</button>
            <input type="file" id="fileInput" style="display: none;" onchange="handleFileUpload(this)">
            <button class="modal-button1" onclick="saveToFile('downloadLink1')">Сохранить</button>
        </div>

        <a id="downloadLink1" style="display: none"></a>
        <br>
        <h3>Результат</h3>


        <table id="difResultFunctionTable" style="width: 100%;">
            <thead>
            <tr>
                <th>X</th>
                <th>Y</th>
            </tr>
            </thead>
            <tbody></tbody>
        </table>



        <button class="modal-button" onclick="serializeDifFunction()">Сохранить</button>


        <a id="downloadLink2" style="display: none"></a>

    </div>
</div>

<div id="operationsModal" class="modal">
    <div class="modal-content">
        <span onclick="closeModal('operationsModal')" style="float: right; cursor: pointer;">&times;</span>
        <h2>Операции</h2>

        <label for="operationSelect">Выберите операцию:</label>
        <select id="operationSelect" style="margin-bottom: 10px;">
            <option value="addition">Сложение</option>
            <option value="subtraction">Вычитание</option>
            <option value="multiplication">Умножение</option>
            <option value="division">Деление</option>
        </select>

        <h3>Первая функция</h3>

        <table id="firstFunctionTable" style="width: 100%;">
            <thead>
            <tr>
                <th>X</th>
                <th>Y</th>
            </tr>
            </thead>
            <tbody></tbody>
        </table>

        <div class="button-container1">
            <button class="modal-button1" onclick="openCreationModalFromOperations()">Создать TabulatedFunction</button>
            <button class="modal-button1" onclick="openMathFunctionModalFromOper()">Создать MathFunction</button>
            <button class="modal-button1" onclick="openFileInput('fileInput1')">Загрузить</button>
            <input type="file" id="fileInput1" style="display: none;" onchange="handleFileUpload(this)">
            <button class="modal-button1" onclick="saveToFile('downloadLink3')">Сохранить</button>
        </div>

        <a id="downloadLink3" style="display: none"></a>
        <br>
        <h3>Вторая функция</h3>


        <table id="secondFunctionTable" style="width: 100%;">
            <thead>
            <tr>
                <th>X</th>
                <th>Y</th>
            </tr>
            </thead>
            <tbody></tbody>
        </table>

        <div class="button-container1">
            <button class="modal-button1" onclick="openCreationModalFromOperations()">Создать TabulatedFunction</button>
            <button class="modal-button1" onclick="openMathFunctionModalFromOper()">Создать MathFunction</button>
            <button class="modal-button1" onclick="openFileInput('fileInput2')">Загрузить</button>
            <input type="file" id="fileInput2" style="display: none;" onchange="handleFileUpload(this)">
            <button class="modal-button1" onclick="saveToFile('downloadLink4')">Сохранить</button>
        </div>

        <a id="downloadLink4" style="display: none"></a>
        <br>
        <h3>Результат</h3>


        <table id="resultFunctionTable" style="width: 100%;">
            <thead>
            <tr>
                <th>X</th>
                <th>Y</th>
            </tr>
            </thead>
            <tbody></tbody>
        </table>



        <button class="modal-button" onclick="serializeOperationResult()">Сохранить</button>


        <a id="downloadLink5" style="display: none"></a>


    </div>
</div>

<div id="creationModal" class="modal">
    <div class="modal-content">
        <span onclick="closeModal('creationModal',null,null,null,null,null,null); resetCreationModal();" style="float: right; cursor: pointer;">&times;</span>
        <h2>Создание TabulatedFunction</h2>
        <input placeholder="Количество точек" class="input" name="text" type="number" id="numberInput">
        <button class="modal-button" onclick="generateTable()">Ок</button><br>

        <table id="dataTable" style="width: 100%;">
            <thead>
            <tr>
                <th>X</th>
                <th>Y</th>
            </tr>
            </thead>
            <tbody></tbody>
        </table>
        <button class="modal-button" onclick="sendCreatedFunction()">Создать</button>
        <a id="createDownloadLink" style="display: none"></a>
    </div>
</div>

<div id="mathFunctionModal" class="modal">
    <div class="modal-content">
        <span onclick="closeModal('mathFunctionModal'); resetMathFunctionModal();" style="float: right; cursor: pointer;">&times;</span>
        <h2>Создание MathFunction</h2>
        <label for="functionSelect">Выберите функцию:</label>
        <select id="functionSelect" name="functionSelect" style="margin-bottom: 10px;">
            <option value="UnitFunction" selected>Единичная функция</option>
            <option value="SqrFunction">Квадратичная функция</option>
            <option value="ZeroFunction">Нулевая функция</option>
            <option value="IdentityFunction">Тождественная функция</option>
        </select>
        <br>
        <input placeholder="Количество точек" class="input" type="number" id="pointCountInput" min="1" step="1">
        <br>
        <input placeholder="Начало промежутка (xFrom)" class="input" type="number" id="xFromInput" step="any">
        <br>
        <input placeholder="Конец промежутка (xTo)" class="input" type="number" id="xToInput" step="any">
        <br>
        <button class="modal-button"onclick="checkMathFunction()">ОК</button>
        <a id="mathDownloadLink" style="display: none"></a>

    </div>
</div>

<div id="settingsModal" class="modal">
    <div class="modal-content">
        <span onclick="closeModal('settingsModal')" style="float: right; cursor: pointer;">&times;</span>
        <h2>Настройки</h2>
        <p>Выберите тип табулированной функции:</p>
        <div class="radio-buttons-container">
            <div class="radio-button">
                <input name="radio-group" id="radio2" class="radio-button__input" type="radio" checked>
                <label for="radio2" class="radio-button__label">
                    <span class="radio-button__custom"></span>
                    ArrayTabulatedFunction
                </label>
            </div>
            <div class="radio-button">
                <input name="radio-group" id="radio1" class="radio-button__input" type="radio">
                <label for="radio1" class="radio-button__label">
                    <span class="radio-button__custom"></span>
                    LinkedListTabulatedFunction
                </label>
            </div>

        </div>
        <br>
        <button class="modal-button" onclick="sendSettings()">ОК</button>
    </div>
</div>

<script>

    let firstOperand = null;
    let secondOperand = null;
    let sizeOne = 0;
    let sizeTwo = 0;
    let MathFromOper = false;
    let MathFromDif = false;
    let isOpenedFromOperations = false;
    let isOpenedFromDif = false;
    let currentTable = 1;

    function sendSettings() {
        let selectors = document.querySelectorAll('input[type="radio"][name="radio-group"]');
        let type;
        if (selectors.item(0).checked)
            type = "ArrayTabulatedFunction";
        else type = "LinkedListTabulatedFunction";
        $.ajax({
            url: "/setSettings",
            type: "POST",
            data: ({functionSelect: type}),
            dataType: "text",
            success: closeModal('settingsModal')
        });
    }

    function checkMathFunction() {
        if (document.getElementById("pointCountInput").value < 2){
            alert("Количество точке должно быть больше 1!");
        } if (document.getElementById("xFromInput").value > document.getElementById("xToInput").value) {
            alert("Значение начала промежутка должно быть больше значения конца!");
        } else sendCreatedMathFunction();
    }

    function sendCreatedMathFunction() {
        if (MathFromDif) {
            $.ajax({
                url: "/differentiateMathFunction",
                type: "POST",
                data: ({functionSelect: document.getElementById("functionSelect").value, pointCount: document.getElementById("pointCountInput").value,
                    xFrom: document.getElementById("xFromInput").value, xTo: document.getElementById("xToInput").value} ),
                dataType: "text",
                success: function(response) {
                        let arr = response.split(':');
                        let inputFuncArray = arr[0].split('|');
                        let diffFuncArray = arr[1].split('|');
                        let arrayInputXString = inputFuncArray[0].split('_');
                        let arrayInputYString = inputFuncArray[1].split('_');
                        let arrayInputX = [];
                        let arrayInputY = [];
                        for (let i = 0; i < arrayInputXString.length; i++){
                            arrayInputX[i] = parseFloat(arrayInputXString[i]);
                            arrayInputY[i] = parseFloat(arrayInputYString[i]);
                        }
                        let arrayOutputXString = diffFuncArray[0].split('_');
                        let arrayOutputYString = diffFuncArray[1].split('_');
                        let arrayOutputX = [];
                        let arrayOutputY = [];
                        for (let i = 0; i < arrayOutputXString.length; i++){
                            arrayOutputX[i] = parseFloat(arrayOutputXString[i]);
                            arrayOutputY[i] = parseFloat(arrayOutputYString[i]);
                        }
                        closeModal('mathFunctionModal',arrayInputX,arrayInputY,arrayOutputX,arrayOutputY);
                }
            });
        } else if (MathFromOper){

            if (firstOperand === null){
                $.ajax({
                    url: "/getMathFunction",
                    type: "POST",
                    data: ({functionSelect: document.getElementById("functionSelect").value, pointCount: document.getElementById("pointCountInput").value,
                        xFrom: document.getElementById("xFromInput").value, xTo: document.getElementById("xToInput").value} ),
                    dataType: "text",
                    success: function(response) {
                        let arr = response.split('|');
                        let arrayInputXString = arr[0].split('_');
                        let arrayInputYString = arr[1].split('_');
                        let arrayInputX = [];
                        let arrayInputY = [];
                        for (let i = 0; i < arrayInputXString.length; i++){
                            arrayInputX[i] = parseFloat(arrayInputXString[i]);
                            arrayInputY[i] = parseFloat(arrayInputYString[i]);
                        }
                        firstOperand = arr[0]+"|"+arr[1];
                        closeModal('mathFunctionModal',arrayInputX,arrayInputY,null,null,null,null);
                    }
                });
            } else {
                let operationType = document.getElementById("operationSelect").value;
                $.ajax({
                    url: "/calculateMathOperationResult",
                    type: "POST",
                    data: ({operationType:operationType, firstOperand:firstOperand,functionSelect: document.getElementById("functionSelect").value, pointCount: document.getElementById("pointCountInput").value,
                        xFrom: document.getElementById("xFromInput").value, xTo: document.getElementById("xToInput").value} ),
                    dataType: "text",
                    success: function(response) {
                        let arr = response.split(':');
                        let secFuncArray = arr[0].split('|');
                        let resFuncArray = arr[1].split('|');
                        let arraySecXString = secFuncArray[0].split('_');
                        let arraySecYString = secFuncArray[1].split('_');
                        let arraySecX = [];
                        let arraySecY = [];
                        for (let i = 0; i < arraySecXString.length; i++){
                            arraySecX[i] = parseFloat(arraySecXString[i]);
                            arraySecY[i] = parseFloat(arraySecYString[i]);
                        }
                        let arrayResXString = resFuncArray[0].split('_');
                        let arrayResYString = resFuncArray[1].split('_');
                        let arrayResX = [];
                        let arrayResY = [];
                        for (let i = 0; i < arrayResXString.length; i++){
                            arrayResX[i] = parseFloat(arrayResXString[i]);
                            arrayResY[i] = parseFloat(arrayResYString[i]);
                        }
                        let firstArr = firstOperand.split('|');
                        let arrayFirstXString = firstArr[0].split('_');
                        let arrayFirstYString = firstArr[1].split('_');
                        let arrayFirstX = [];
                        let arrayFirstY = [];
                        for (let i = 0; i < arrayFirstXString.length; i++){
                            arrayFirstX[i] = parseFloat(arrayFirstXString[i]);
                            arrayFirstY[i] = parseFloat(arrayFirstYString[i]);
                        }
                        closeModal('mathFunctionModal',arrayFirstX,arrayFirstY,arrayResX,arrayResY,arraySecX,arraySecY);
                    }
                });
            }
        } else {
        $.ajax({
            url: "/serializeMathFunction",
            type: "POST",
            data: ({functionSelect: document.getElementById("functionSelect").value, pointCount: document.getElementById("pointCountInput").value,
                xFrom: document.getElementById("xFromInput").value, xTo: document.getElementById("xToInput").value} ),
            dataType: "text",
            success: function (response) {
                console.log(response);
                const blob = new Blob([response], {type: 'text/plain'});
                const downloadLink = document.getElementById("mathDownloadLink");
                downloadLink.href = URL.createObjectURL(blob);
                const fileName = prompt('Введите название файла:', 'MathFunction.txt');
                if (fileName) {
                    downloadLink.download = fileName;
                    downloadLink.click();
                    //const buttonContainer = event.currentTarget.parentElement;
                }
            }
        });
            closeModal('mathFunctionModal',null,null,null,null);
        }
    }

    function sendCreatedFunction(){
            if (isOpenedFromDif){
                var X = [];
                var inputsX = document.querySelectorAll('input[type="number"][name="inputX"]');
                var Y = [];
                var inputsY = document.querySelectorAll('input[type="number"][name="inputY"]');
                for (let i = 0; i <inputsX.length; ++i){
                    var valueX = parseFloat(inputsX[i].value);
                    var valueY = parseFloat(inputsY[i].value);
                    X.push(valueX);
                    Y.push(valueY)
                }
                const stringX = X.join('_');
                const stringY = Y.join('_');
                $.ajax({
                    url: "/differentiateFunction",
                    type: "POST",
                    data: ({X: stringX,Y: stringY}),
                    dataType: "text",
                    success: function(response) {
                        let arr = response.split('|');
                        let arrayXString = arr[0].split('_');
                        let arrayYString = arr[1].split('_');
                        let arrayX = [];
                        let arrayY = [];
                        for (let i = 0; i < arrayXString.length; i++){
                            arrayX[i] = parseFloat(arrayXString[i]);
                            arrayY[i] = parseFloat(arrayYString[i]);
                        }
                        closeModal('creationModal',null,null,arrayX,arrayY);
                    }
                });
            }
            else if (isOpenedFromOperations){
                    if (firstOperand === null){
                        var X = []; var Y = [];
                        var inputsX = document.querySelectorAll('input[type="number"][name="inputX"]');
                        var inputsY = document.querySelectorAll('input[type="number"][name="inputY"]');
                        for (let i = 0; i <inputsX.length; ++i){
                            var valueX = parseFloat(inputsX[i].value);
                            var valueY = parseFloat(inputsY[i].value);
                            X.push(valueX);
                            Y.push(valueY);
                        }
                        const stringX = X.join('_');
                        const stringY = Y.join('_');
                        firstOperand = stringX+'|'+stringY;
                        closeModal('creationModal',null,null,null,null);
                    } else {
                        var X = [];
                        var Y = [];
                        var inputsX = document.querySelectorAll('input[type="number"][name="inputX"]');
                        var inputsY = document.querySelectorAll('input[type="number"][name="inputY"]');
                        for (let i = 0; i < inputsX.length; ++i) {
                            var valueX = parseFloat(inputsX[i].value);
                            var valueY = parseFloat(inputsY[i].value);
                            X.push(valueX);
                            Y.push(valueY);
                        }
                        const stringX = X.join('_');
                        const stringY = Y.join('_');
                        let secondOperand = stringX + '|' + stringY;
                        let operationType = document.getElementById("operationSelect").value;
                        $.ajax({
                            url: "/calculateOperationResult",
                            type: "POST",
                            data: ({
                                operationType: operationType,firstOperand:firstOperand,secondOperand:secondOperand}),
                            dataType: "text",
                            success: function (response) {
                                let arr = response.split('|');
                                let arrayXString = arr[0].split('_');
                                let arrayYString = arr[1].split('_');
                                let arrayX = [];
                                let arrayY = [];
                                for (let i = 0; i < arrayXString.length; i++){
                                    arrayX[i] = parseFloat(arrayXString[i]);
                                    arrayY[i] = parseFloat(arrayYString[i]);
                                }
                                closeModal('creationModal',null,null,arrayX,arrayY);
                                firstOperand = null;
                            }
                        });

                    }
            } else {
                var X = []; var Y = [];
                var inputsX = document.querySelectorAll('input[type="number"][name="inputX"]');
                var inputsY = document.querySelectorAll('input[type="number"][name="inputY"]');
                for (let i = 0; i <inputsX.length; ++i){
                    var valueX = parseFloat(inputsX[i].value);
                    var valueY = parseFloat(inputsY[i].value);
                    X.push(valueX);
                    Y.push(valueY);
                }
                const stringX = X.join('_');
                const stringY = Y.join('_');
                $.ajax({
                    url: "/serializeTabulatedFunction",
                    type: "POST",
                    data: ({X: stringX,Y: stringY}),
                    dataType: "text",
                    success: function(response) {
                        const blob = new Blob([response], {type: 'text/plain'});
                        const downloadLink = document.getElementById("createDownloadLink");
                        downloadLink.href = URL.createObjectURL(blob);
                        const fileName = prompt('Введите название файла:', 'название_файла.txt');
                        if (fileName) {
                            downloadLink.download = fileName;
                            downloadLink.click();
                            //const buttonContainer = event.currentTarget.parentElement;
                        }
                    }
                });
                closeModal('creationModal',null,null,null,null);
            }
    }

    function serializeDifFunction(){
        var X = []; var Y = [];
        var inputsX = document.querySelectorAll('input[type="text"][name="resX"]');
        var inputsY = document.querySelectorAll('input[type="text"][name="resY"]');
        for (let i = 0; i <inputsX.length; ++i){
            var valueX = parseFloat(inputsX[i].value);
            var valueY = parseFloat(inputsY[i].value);
            X.push(valueX);
            Y.push(valueY)
        }
        const stringX = X.join('_');
        const stringY = Y.join('_');
        $.ajax({
            url: "/serializeTabulatedFunction",
            type: "POST",
            data: ({X: stringX,Y: stringY}),
            dataType: "text",
            success: function(response) {
                const blob = new Blob([response], { type: 'text/plain' });
                const downloadLink = document.getElementById("downloadLink2");
                downloadLink.href = URL.createObjectURL(blob);
                const fileName = prompt('Введите название файла:', 'DifferentialResult.txt');
                if (fileName) {
                    downloadLink.download = fileName;
                    downloadLink.click();
                    //const buttonContainer = event.currentTarget.parentElement;
                }
            }
        });
        closeModal('creationModal',null,null,null,null);
    }

    function deserializeDiffFunction(str){

        $.ajax({
            url: "/deserializeTabulatedFunction",
            type: "POST",
            data: ({str: str}),
            dataType: "text",
            success: function(response) {
                let arr = response.split(':');
                let FuncArray = arr[0].split('|');
                let diffFuncArray = arr[1].split('|');
                let funcXString = FuncArray[0].split('_');
                let funcSecYString = FuncArray[1].split('_');
                let arrayFuncX = [];
                let arrayFuncY = [];
                for (let i = 0; i < funcXString.length; i++){
                    arrayFuncX[i] = parseFloat(funcXString[i]);
                    arrayFuncY[i] = parseFloat(funcSecYString[i]);
                }
                let diffXString = diffFuncArray[0].split('_');
                let diffYString = diffFuncArray[1].split('_');
                let arrayDiffX = [];
                let arrayDiffY = [];
                for (let i = 0; i < diffXString.length; i++){
                    arrayDiffX[i] = parseFloat(diffXString[i]);
                    arrayDiffY[i] = parseFloat(diffYString[i]);
                }
                document.getElementById('pointCountInput').value = arrayFuncX.length;
                generateTableForMath(arrayFuncX,arrayFuncY);
                generateTableForRes(arrayDiffX,arrayDiffY);
                isOpenedFromDif = false;
            }
        });

    }

    function serializeOperationResult(){
        var X = []; var Y = [];

        var resX = document.querySelectorAll('input[type="text"][name="operResX"]');
        var resY = document.querySelectorAll('input[type="text"][name="operResY"]');
        for (let i = 0; i <resX.length; ++i){
            var valueX = parseFloat(resX[i].value);
            var valueY = parseFloat(resY[i].value);
            X.push(valueX);
            Y.push(valueY)
        }
        const stringX = X.join('_');
        const stringY = Y.join('_');
        $.ajax({
            url: "/serializeOperationResult",
            type: "POST",
            data: ({X: stringX,Y: stringY}),
            dataType: "text",
            success: function(response) {
                const blob = new Blob([response], { type: 'text/plain' });
                const downloadLink = document.getElementById("downloadLink5");
                downloadLink.href = URL.createObjectURL(blob);
                const fileName = prompt('Введите название файла:', 'OperationResult.txt');
                if (fileName) {
                    downloadLink.download = fileName;
                    downloadLink.click();
                }
            }
        });
        closeModal('creationModal',null,null,null,null);
    }

    function closeModal(modalId,inputX,inputY,outputsX,outputsY,inputX1,inputY1) {
        const modal = document.getElementById(modalId);
        if (modalId === 'creationModal') {
                // Если окно "Создание" закрывается и оно открыто из "Операции", тогда передаем данные в "Операции"
            if (isOpenedFromOperations) {
                fillOperationsTable();
                if (sizeOne === sizeTwo){
                    sizeOne = 0;
                    sizeTwo = 0;
                    currentTable = 1;
                    generateTableForOperation(outputsX,outputsY);
                }
                isOpenedFromOperations = false; // сбрасываем флаг
            } else // Если окно "Создание" закрывается и оно открыто из "Диф", тогда передаем данные в "Диф"
            if (isOpenedFromDif) {
                fillOperationsTableDif(outputsX,outputsY);
                isOpenedFromOperations = false; // сбрасываем флаг
            }
        }
        if (modalId === 'mathFunctionModal'){
            if(MathFromDif){
                generateTableForMath(inputX,inputY);
                generateTableForRes(outputsX,outputsY);
                document.getElementById('mathFunctionModal').style.display = 'none';
                MathFromDif = false;
            }
            else{
                if(MathFromOper){
                    if ( currentTable % 2 !== 0) {
                        generateTableForMathOperation(inputX,inputY);
                        currentTable++;
                    }
                    else generateTableForMathOperation(inputX1,inputY1);

                    if (sizeOne === sizeTwo) generateTableForOperation(outputsX,outputsY);
                    document.getElementById('mathFunctionModal').style.display = 'none';
                    MathFromOper = false;
                }
            }
        }
        modal.style.display = 'none';
         resetMathFunctionModal();
         resetCreationModal();
        if (modalId === 'creationModal') {
            // После переноса данных в таблицу "Операции", закрываем окно "Создание"
            document.getElementById('creationModal').style.display = 'none';
        }
        resetCreationModal();
    }

    function generateTable() {
        const numberInput = document.getElementById('numberInput').value;
        const tableBody = document.querySelector('#dataTable tbody');
        tableBody.innerHTML = '';
        if (currentTable % 2 === 0){
            sizeTwo = numberInput;
        }
        else {
            sizeOne = numberInput;
        }
        for (let i = 0; i < numberInput; i++) {
            const row = tableBody.insertRow();
            const cellX = row.insertCell(0);
            const cellY = row.insertCell(1);

            cellX.innerHTML = `<input type="number" name="inputX" step="any">`;
            cellY.innerHTML = `<input type="number" name="inputY" step="any">`;
        }
    }

    function generateTableForRes(outputsX,outputsY) {
        const tableBody = document.querySelector('#difResultFunctionTable tbody');
        tableBody.innerHTML = '';

        for (var i = 0; i < outputsX.length; i++) {
            var newRow = tableBody.insertRow();
            var cellX = newRow.insertCell(0);
            var cellY = newRow.insertCell(1);

            cellX.innerHTML = '<input type="text" name="resX" value="' + outputsX[i] + '" readonly>';
            cellY.innerHTML = '<input type="text" name="resY" value="' + outputsY[i] + '" readonly>';
        }
    }

    function generateTableForMath(inputX,inputY) {
        const numberInput = document.getElementById('pointCountInput').value;
        const tableBody = document.querySelector('#difFunctionTable tbody');
        tableBody.innerHTML = '';

        for (var i = 0; i < numberInput; i++) {
            var newRow = tableBody.insertRow();
            var cellX = newRow.insertCell(0);
            var cellY = newRow.insertCell(1);

            cellX.innerHTML = '<input type="text" name="resX" value="' + inputX[i] + '" readonly>';
            cellY.innerHTML = '<input type="text" name="resY" value="' + inputY[i] + '" readonly>';
        }
    }

    function generateTableForOperation(outputsX,outputsY) {
        const tableBody = document.querySelector('#resultFunctionTable tbody');
        tableBody.innerHTML = '';
        for (var i = 0; i < outputsX.length; i++) {
            var newRow = tableBody.insertRow();
            var cellX = newRow.insertCell(0);
            var cellY = newRow.insertCell(1);
            cellX.innerHTML = '<input type="text" name="operResX" value="' + outputsX[i] + '" readonly>';
            cellY.innerHTML = '<input type="text" name="operResY" value="' + outputsY[i] + '" readonly>';
        }
    }

    function generateTableForMathOperation(inputX,inputY) {
        const numberInput = document.getElementById('pointCountInput').value;
        if (currentTable % 2 !== 0){
            const tableBody = document.querySelector('#firstFunctionTable tbody');
            sizeOne = numberInput;
            tableBody.innerHTML = '';

            for (var i = 0; i < numberInput; i++) {
                var newRow = tableBody.insertRow();
                var cellX = newRow.insertCell(0);
                var cellY = newRow.insertCell(1);

                cellX.innerHTML = '<input type="text" name="resX" value="' + inputX[i] + '" readonly>';
                cellY.innerHTML = '<input type="text" name="resY" value="' + inputY[i] + '" readonly>';
            }

        }
        else {
            const tableBody = document.querySelector('#secondFunctionTable tbody');
            sizeTwo = numberInput;
            tableBody.innerHTML = '';

            for (var i = 0; i < numberInput; i++) {
                var newRow = tableBody.insertRow();
                var cellX = newRow.insertCell(0);
                var cellY = newRow.insertCell(1);

                cellX.innerHTML = '<input type="text" name="resX" value="' + inputX[i] + '" readonly>';
                cellY.innerHTML = '<input type="text" name="resY" value="' + inputY[i] + '" readonly>';
            }

        }
    }

    function resetCreationModal() {
        // Сбрасываем значения полей ввода
        document.getElementById('numberInput').value = '';
        // Очищаем таблицу
        document.querySelector('#dataTable tbody').innerHTML = '';
        // Другие поля ввода, которые нужно сбросить, добавляйте сюда
    }

    function resetMathFunctionModal() {
        // Сбрасываем значения полей ввода
        document.getElementById('functionSelect').value = 'ConstantFunction';
        document.getElementById('pointCountInput').value = '';
        document.getElementById('xFromInput').value = '';
        document.getElementById('xToInput').value = '';
        // Другие поля ввода, которые нужно сбросить, добавляйте сюда
    }

    function fillOperationsTable() {
        var creationTable = document.querySelector('#dataTable');
        var creationTableBody = creationTable.querySelector('tbody');
        var Table = (currentTable % 2 === 0) ? 'secondFunctionTable' : 'firstFunctionTable';
        var operationsTable = document.querySelector('#' + Table);
        var operationsTableBody = operationsTable.querySelector('tbody');
        operationsTableBody.innerHTML = '';
        for (var i = 0; i < creationTableBody.rows.length; i++) {
            var row = creationTableBody.rows[i];
            var cellXValue = row.cells[0].querySelector('input').value;
            var cellYValue = row.cells[1].querySelector('input').value;

            var newRow = operationsTableBody.insertRow();
            var cellX = newRow.insertCell(0);
            var cellY = newRow.insertCell(1);
            cellX.innerHTML = '<input type="text" value="' + cellXValue + '" readonly>';
            cellY.innerHTML = '<input type="text" value="' + cellYValue + '" readonly>';
        }
        currentTable++;
    }

    function openCreationModalFromOperations() {
        isOpenedFromOperations = true;
        openModal('creationModal');
    }

    function openFileInput(field) {
        document.getElementById('fileInput').click();
        if (field === "diff"){
            isOpenedFromDif = true;
        }
    }

    function openMathFunctionModal() {
        openModal('mathFunctionModal');
    }

    function openMathFunctionModalFromDif() {
        MathFromDif = true
        openModal('mathFunctionModal');
    }

    function openMathFunctionModalFromOper() {
        MathFromOper = true
        openModal('mathFunctionModal');
    }

    function openModal(modalId) {
        document.getElementById(modalId).style.display = 'flex';
    }

    function openOperationsModal() {
        // Очистка данных перед открытием модального окна
        clearTableData('firstFunctionTable');
        clearTableData('secondFunctionTable');
        clearTableData('resultFunctionTable');

        // Открываем модальное окно
        openModal('operationsModal');
    }

    function openCreationModalFromDif() {
        isOpenedFromDif = true
        openModal('creationModal');
    }

    function handleFileUpload(input) {
        var file = input.files[0]; // Получаем выбранный пользователем файл
         if (file) {
             var reader = new FileReader();
             reader.onload = function(e) {
                 var fileContent = e.target.result; // Получаем содержимое файла в виде строки
                 if (isOpenedFromDif){
                     deserializeDiffFunction(fileContent);
                 }
             };
             reader.readAsText(file); // Читаем файл как текстовую строку
         }
    }

    function saveToFile(downloadLinkId) {
        const dataToSave = "Здесь ваш текст или данные для сохранения";

        // Создаем новый Blob (двоичные данные) из данных
        const blob = new Blob([dataToSave], { type: 'text/plain' });

        // Создаем ссылку и прикрепляем Blob к ней
        const downloadLink = document.getElementById(downloadLinkId);
        downloadLink.href = URL.createObjectURL(blob);

        // Запрашиваем у пользователя название файла
        const fileName = prompt('Введите название файла:', 'название_файла.txt');

        // Если пользователь ввел название файла, продолжаем
        if (fileName) {
            // Устанавливаем атрибут download с указанием названия файла
            downloadLink.download = fileName;

            // Генерируем событие клика на ссылке
            downloadLink.click();

            const buttonContainer = event.currentTarget.parentElement;
            if (buttonContainer.classList.contains('button-container1')) {
                // Если вызвана из button-container1, то ничего не делаем
            } else {
                // Если вызвана из modal-button, то закрываем модальное окно
                closeModal('operationsModal');
                closeModal('differentiationModal');
            }
        }
    }

    function clearTableData(tableId) {
        const tableBody = document.getElementById(tableId).querySelector('tbody');
        tableBody.innerHTML = '';

    }

    function fillOperationsTableDif(outputsX,outputsY) {
// Получите данные из таблицы "Создание"
        const creationTable = document.querySelector('#dataTable');
        const creationTableBody = creationTable.querySelector('tbody');

// Очистите таблицу "Операции"
        const operationsTable = document.querySelector('#difFunctionTable');
        var operationsTableBody = operationsTable.querySelector('tbody');
        operationsTableBody.innerHTML = '';

// Перенесите данные из таблицы "Создание" в таблицу "Операции"
        for (var i = 0; i < creationTableBody.rows.length; i++) {
            var row = creationTableBody.rows[i];
            var cellXValue = row.cells[0].querySelector('input').value;
            var cellYValue = row.cells[1].querySelector('input').value;

            var newRow = operationsTableBody.insertRow();
            var cellX = newRow.insertCell(0);
            var cellY = newRow.insertCell(1);

            cellX.innerHTML = '<input type="text" value="' + cellXValue + '" readonly>';
            cellY.innerHTML = '<input type="text" value="' + cellYValue + '" readonly>';
        }
        const operationsTableRes = document.querySelector('#difResultFunctionTable');
        var operationsTableBodyRes = operationsTableRes.querySelector('tbody');
        operationsTableBodyRes.innerHTML = '';

// Перенесите данные из таблицы "Создание" в таблицу "Операции"
        for (var i = 0; i < outputsX.length; i++) {
            var newRow = operationsTableBodyRes.insertRow();
            var cellX = newRow.insertCell(0);
            var cellY = newRow.insertCell(1);

            cellX.innerHTML = '<input type="text" name="resX" value="' + outputsX[i] + '" readonly>';
            cellY.innerHTML = '<input type="text" name="resY" value="' + outputsY[i] + '" readonly>';
        }

    }

</script>
</body>
</html>