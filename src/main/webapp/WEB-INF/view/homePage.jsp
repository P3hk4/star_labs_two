<%@ taglib prefix="form" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Моя Страница</title>
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/styles.css" />">
<body>

<div class="card-container">
    <div class="card">
        <p class="heading">Card 1</p>
        <p>Powered By</p>
        <p>Uiverse</p>

        <button class="button" onclick="openModal('settingsModal')">Настройки</button>

    </div>
    <div class="card">
        <p class="heading">Card 1</p>
        <p>Powered By</p>
        <p>Uiverse</p>

        <button class="button" onclick="openModal('creationModal')">Создание</button>

    </div>
    <div class="card">
        <p class="heading">Card 1</p>
        <p>Powered By</p>
        <p>Uiverse</p>

        <button class="button" onclick="openModal('mathFunctionModal')">Создание MathFunction</button>

    </div>
    <div class="card">
        <p class="heading">Card 1</p>
        <p>Powered By</p>
        <p>Uiverse</p>

        <button class="button" onclick="openModal('operationsModal')">Операции</button>

    </div>
    <div class="card">
        <p class="heading">Card 1</p>
        <p>Powered By</p>
        <p>Uiverse</p>

        <button class="button" onclick="openModal('differentiationModal')">Дифференцирование</button>

    </div>

</div>


<div id="differentiationModal" class="modal">
    <div class="modal-content">
        <span onclick="closeModal('differentiationModal')" style="float: right; cursor: pointer;">&times;</span>
        <h3>Первая функция</h3>


        <table id="firstFunctionTable">
            <thead>
            <tr>
                <th>X</th>
                <th>Y</th>
            </tr>
            </thead>
            <tbody></tbody>
        </table>


        <button onclick="openCreationModalFromOperations()">Открыть Создание</button>
        <button class="button" onclick="openModal('mathFunctionModal')">Открыть MathFunction</button>
        <button class="button" onclick="openFileInput()">Загрузить</button>
        <input type="file" id="fileInput" style="display: none;" onchange="handleFileUpload(this)">
        <button class="button" onclick="saveToFile()">Сохранить</button>


        <a id="downloadLink" style="display: none"></a>
        <br>
        <h3>Результат</h3>


        <table id="firstFunctionTable">
            <thead>
            <tr>
                <th>X</th>
                <th>Y</th>
            </tr>
            </thead>
            <tbody></tbody>
        </table>



        <button class="button" onclick="saveToFile()">Сохранить</button>


        <a id="downloadLink" style="display: none"></a>

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


        <table id="firstFunctionTable">
            <thead>
            <tr>
                <th>X</th>
                <th>Y</th>
            </tr>
            </thead>
            <tbody></tbody>
        </table>


        <button onclick="openCreationModalFromOperations()">Открыть Создание</button>
        <button class="button" onclick="openModal('mathFunctionModal')">Открыть MathFunction</button>
        <button class="button" onclick="openFileInput()">Загрузить</button>
        <input type="file" id="fileInput" style="display: none;" onchange="handleFileUpload(this)">
        <button class="button" onclick="saveToFile()">Сохранить</button>


        <a id="downloadLink" style="display: none"></a>
        <br>
        <h3>Вторая функция</h3>


        <table id="firstFunctionTable">
            <thead>
            <tr>
                <th>X</th>
                <th>Y</th>
            </tr>
            </thead>
            <tbody></tbody>
        </table>


        <button onclick="openCreationModalFromOperations()">Открыть Создание</button>
        <button class="button" onclick="openModal('mathFunctionModal')">Открыть MathFunction</button>
        <button class="button" onclick="openFileInput()">Загрузить</button>
        <input type="file" id="fileInput" style="display: none;" onchange="handleFileUpload(this)">
        <button class="button" onclick="saveToFile()">Сохранить</button>


        <a id="downloadLink" style="display: none"></a>
        <br>
        <h3>Результат</h3>


        <table id="firstFunctionTable">
            <thead>
            <tr>
                <th>X</th>
                <th>Y</th>
            </tr>
            </thead>
            <tbody></tbody>
        </table>



        <button class="button" onclick="saveToFile()">Сохранить</button>


        <a id="downloadLink" style="display: none"></a>


    </div>
</div>


<div id="creationModal" class="modal">
    <div class="modal-content">
        <span onclick="closeModal('creationModal'); resetCreationModal();" style="float: right; cursor: pointer;">&times;</span>
        <h2>Создание</h2>
        <label for="numberInput">Введите число:</label>
        <input type="number" id="numberInput">
        <button onclick="generateTable()">Создать таблицу</button>

        <table id="dataTable">
            <thead>
            <tr>
                <th>X</th>
                <th>Y</th>
            </tr>
            </thead>
            <tbody></tbody>
        </table>
        <button onclick="closeModal('creationModal')">ОК</button>
    </div>
</div>


<div id="mathFunctionModal" class="modal">
    <div class="modal-content">
        <span onclick="closeModal('mathFunctionModal'); resetMathFunctionModal();" style="float: right; cursor: pointer;">&times;</span>
        <h2>Создание MathFunction</h2>

        <form method="post" action="/createMathFunction">
        <label for="functionSelect">Выберите функцию:</label>
        <select id="functionSelect" name="functionSelect" style="margin-bottom: 10px;">
            <option value="ConstantFunction">ConstantFunction</option>
            <option value="IdentityFunction">IdentityFunction</option>
            <option value="UnitFunction">UnitFunction</option>
            <option value="ZeroFunction">ZeroFunction</option>
            <option value="SqrFunction">SqrFunction</option>
        </select>
        <br>
        <label for="pointCountInput">Количество точек:</label>
        <input type="number" id="pointCountInput" name="pointCountInput" min="1" step="1" >

        <br>

        <label for="xFromInput">xFrom:</label>
        <input type="number" id="xFromInput" name="xFromInput" step="any" >

        <br>

        <label for="xToInput">xTo:</label>
        <input type="number" id="xToInput"  name="xToInput" step="any" >
        <br>
        <input type="submit" onclick="closeModal('mathFunctionModal')" value="ОК">

        </form>

    </div>
</div>


<div id="settingsModal" class="modal">
    <div class="modal-content">
        <span onclick="closeModal('settingsModal')" style="float: right; cursor: pointer;">&times;</span>
        <h2>Настройки</h2>
        <p>Выберите тип табулированной функции:</p>
        <form action="/getSettings" method="post">
        <label><input type="radio" name="tabulatedFunctionType" value="ArrayTabulatedFunction"> ArrayTabulatedFunction</label>
        <label><input type="radio" name="tabulatedFunctionType" value="LinkedListTabulatedFunction"> LinkedListTabulatedFunction</label>
            <br>

        <input type="submit" onclick="closeModal('settingsModal')" value="ОК">
        </form>
    </div>
</div>

<script>
    let isOpenedFromOperations = false;

    function openCreationModalFromOperations() {
        isOpenedFromOperations = true;
        openModal('creationModal');
    }
    // Функция для открытия модального окна
    function openModal(modalId) {
        document.getElementById(modalId).style.display = 'flex';
    }

    // Функция для закрытия модального окна
    function closeModal(modalId) {

        const modal = document.getElementById(modalId);

        if (modalId === 'creationModal') {
            // Если окно "Создание" закрывается и оно открыто из "Операции", тогда передаем данные в "Операции"
            if (isOpenedFromOperations) {
                fillOperationsTable();
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

            cellX.innerHTML = `<input type="number" step="any">`;
            cellY.innerHTML = `<input type="number" step="any">`;
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
        const creationTable = document.querySelector('#dataTable');
        const creationTableBody = creationTable.querySelector('tbody');

        // Очистите таблицу "Операции"
        const operationsTable = document.querySelector('#firstFunctionTable');
        const operationsTableBody = operationsTable.querySelector('tbody');
        operationsTableBody.innerHTML = '';

        // Перенесите данные из таблицы "Создание" в таблицу "Операции"
        for (const row of creationTableBody.rows) {
            const cellXValue = row.cells[0].querySelector('input').value;
            const cellYValue = row.cells[1].querySelector('input').value;

            const newRow = operationsTableBody.insertRow();
            const cellX = newRow.insertCell(0);
            const cellY = newRow.insertCell(1);

            cellX.innerHTML = `<input type="text" value="${cellXValue}" readonly>`;
            cellY.innerHTML = `<input type="text" value="${cellYValue}" readonly>`;
        }
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
    function saveToFile() {
        const dataToSave = "Здесь ваш текст или данные для сохранения";

        // Создаем новый Blob (двоичные данные) из данных
        const blob = new Blob([dataToSave], { type: 'text/plain' });

        // Создаем ссылку и прикрепляем Blob к ней
        const downloadLink = document.getElementById('downloadLink');
        downloadLink.href = URL.createObjectURL(blob);

        // Запрашиваем у пользователя название файла
        const fileName = prompt('Введите название файла:', 'название_файла.txt');

        // Если пользователь ввел название файла, продолжаем
        if (fileName) {
            // Устанавливаем атрибут download с указанием названия файла
            downloadLink.download = fileName;

            // Генерируем событие клика на ссылке
            downloadLink.click();
        }
    }
</script>
</body>
</html>