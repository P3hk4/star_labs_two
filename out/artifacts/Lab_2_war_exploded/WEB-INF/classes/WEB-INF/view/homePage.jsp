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
            <button class="modal-button1" onclick="openModal('mathFunctionModal')">Открыть MathFunction</button>
            <button class="modal-button1" onclick="openFileInput()">Загрузить</button>
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



        <button class="modal-button" onclick="saveToFile('downloadLink2')">Сохранить</button>


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
            <button class="modal-button1" onclick="openModal('mathFunctionModal')">Создать MathFunction</button>
            <button class="modal-button1" onclick="openFileInput()">Загрузить</button>
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
            <button class="modal-button1" onclick="openModal('mathFunctionModal')">Создать MathFunction</button>
            <button class="modal-button1" onclick="openFileInput()">Загрузить</button>
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



        <button class="modal-button" onclick="saveToFile('downloadLink5')">Сохранить</button>


        <a id="downloadLink5" style="display: none"></a>


    </div>
</div>

<div id="creationModal" class="modal">
    <div class="modal-content">
        <span onclick="closeModal('creationModal'); resetCreationModal();" style="float: right; cursor: pointer;">&times;</span>
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
        if (isOpenedFromDif) {
            $.ajax({
                url: "/differentiateMathFunction",
                type: "POST",
                data: ({functionSelect: document.getElementById("functionSelect").value, pointCount: document.getElementById("pointCountInput").value,
                    xFrom: document.getElementById("xFromInput").value, xTo: document.getElementById("xToInput").value} ),
                dataType: "text",
                success: function(response) {
                        var array = JSON.parse(response); // Преобразование строки в массив
                        var result = array.map(function(subArray) {
                            return subArray.map(Number); // Преобразование каждого элемента в числовой тип
                        });
                        console.log(result);
                        closeModal('mathFunctionModal');
                        }
            });
        } else if (isOpenedFromOperations){

        } else {
        $.ajax({
            url: "/serializeMathFunction",
            type: "POST",
            data: ({functionSelect: document.getElementById("functionSelect").value, pointCount: document.getElementById("pointCountInput").value,
                xFrom: document.getElementById("xFromInput").value, xTo: document.getElementById("xToInput").value} ),
            dataType: "text",
            success: function (response) {
                console.log(response);
                closeModal('mathFunctionModal');
            }
        });
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
                console.log(stringX);
                console.log(stringY);
                $.ajax({
                    url: "/differentiateFunction",
                    type: "POST",
                    data: ({X: stringX,Y: stringY}),
                    dataType: "text",
                    success: function(response) {
                        alert(response);
                        let arr = response.split('|');
                        let arrayXString = arr[0].split('_');
                        let arrayYString = arr[1].split('_');
                        let arrayX = [];
                        let arrayY = [];
                        for (let i = 0; i < arrayXString.length; i++){
                            arrayX[i] = parseFloat(arrayXString[i]);
                            arrayY[i] = parseFloat(arrayYString[i]);
                        }
                        closeModal('creationModal',arrayX,arrayY);
                    }
                });
            }
    }

    function openCreationModalFromOperations() {
        isOpenedFromOperations = true;
        openModal('creationModal');
    }
    // Функция для открытия модального окна
    function openModal(modalId) {
        document.getElementById(modalId).style.display = 'flex';
    }

    // Функция для закрытия модального окна
    function closeModal(modalId,inputX,inputY,outputsX,outputsY) {
        const modal = document.getElementById(modalId);


        if (modalId === 'creationModal') {
            // Если окно "Создание" закрывается и оно открыто из "Операции", тогда передаем данные в "Операции"
            if (isOpenedFromOperations) {
                fillOperationsTable();
                isOpenedFromOperations = false; // сбрасываем флаг
            } else // Если окно "Создание" закрывается и оно открыто из "Диф", тогда передаем данные в "Диф"
                if (isOpenedFromDif) {
                    fillOperationsTableDif(outputsX,outputsY);
                    isOpenedFromOperations = false; // сбрасываем флаг
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

    // Функция для создания таблицы
    function generateTable() {
        const numberInput = document.getElementById('numberInput').value;
        const tableBody = document.querySelector('#dataTable tbody');
        tableBody.innerHTML = '';

        for (let i = 0; i < numberInput; i++) {
            const row = tableBody.insertRow();
            const cellX = row.insertCell(0);
            const cellY = row.insertCell(1);

            cellX.innerHTML = `<input type="number" name="inputX" step="any">`;
            cellY.innerHTML = `<input type="number" name="inputY" step="any">`;
        }
    }

    // Функция для сброса значений полей в модальном окне "Создание"
    function resetCreationModal() {
        // Сбрасываем значения полей ввода
        document.getElementById('numberInput').value = '';
        // Очищаем таблицу
        document.querySelector('#dataTable tbody').innerHTML = '';
        // Другие поля ввода, которые нужно сбросить, добавляйте сюда
    }

    // Функция для сброса значений полей в модальном окне "Создание MathFunction"
    function resetMathFunctionModal() {
        // Сбрасываем значения полей ввода
        document.getElementById('functionSelect').value = 'ConstantFunction';
        document.getElementById('pointCountInput').value = '';
        document.getElementById('xFromInput').value = '';
        document.getElementById('xToInput').value = '';
        // Другие поля ввода, которые нужно сбросить, добавляйте сюда
    }

    // Функция для сброса значений полей в модальном окне "Операции"
    function resetOperationsModal() {
        // Сбрасываем значения полей в модальном окне "Операции"
        // Добавьте сюда код для сброса значений или очистки интерфейса
    }

    function fillOperationsTable() {
// Получите данные из таблицы "Создание"
        var creationTable = document.querySelector('#dataTable');
        var creationTableBody = creationTable.querySelector('tbody');

// Определение текущей таблицы
        var Table = (currentTable % 2 === 0) ? 'secondFunctionTable' : 'firstFunctionTable';

// Очистите текущую таблицу "Операции"
        var operationsTable = document.querySelector('#' + Table);
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
        currentTable++;
    }

    function openMathFunctionModal() {
        openModal('mathFunctionModal');
    }

    function openFileInput() {
        document.getElementById('fileInput').click();
    }

    // Функция для обработки загруженного файла
    function handleFileUpload(input) {
        const file = input.files[0];

        if (file) {
            // Здесь вы можете добавить логику для обработки загруженного файла
            console.log('Выбранный файл:', file.name);
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