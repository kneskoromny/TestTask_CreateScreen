# TestTask_CreateScreen
## Тестовое задание - создание экрана с возможностью добавления и удаления элементов

### Описание:
Разработайте экран, где человек может заполнить информацию о себе и своих детях.
Сверху должны быть поля ввода ФИО и возраста пользователя.

Ниже должна вводится информация о детях. Изначально пользователь видит только кнопку "+", при нажатии на нее появляется блок в котором можно ввести информацию о ребенке: Имя и возраст. Таким образом пользователь может добавить вплоть до 5 детей. Когда пользователь добавил 5 детей — кнопка "+" исчезает и больше недоступна.

Так же напротив каждого ребенка есть кнопка "удалить" , при нажатии на которую соответствующая запись удаляется.

Внизу экрана расположена кнопка "Очистить". При нажатии на нее появляется ActionSheet с двумя кнопками "Сбросить данные" и "Отмена". При нажатии на кнопку "Сбросить данные", все данные ранные введенные на этой странице сбрасываются (в том числе удаляются все дети) и ActionSheet закрывается. При нажатии на кнопку "Отмена" ActionSheet закрывается и сброса данных не происходит.

### Стек:
 * выполнил верстку кодом, без сториборд и xib
 * подключил Snapkit через Carthage
 * custom views

### Скриншоты:
![Page-3_mobile (1)](https://user-images.githubusercontent.com/25160645/142156356-a09c698e-898a-4599-a18e-08a35fefd0d6.png)
![Simulator Screen Shot - iPhone 13 Pro Max - 2021-11-17 at 10 31 47](https://user-images.githubusercontent.com/25160645/142156378-bc1ea18f-489f-4dc4-8bf5-e5961095ef91.png)
![Simulator Screen Shot - iPhone 13 Pro Max - 2021-11-17 at 10 32 18](https://user-images.githubusercontent.com/25160645/142156392-d5569327-94ac-4fd2-9b20-8e406763dde3.png)
![Simulator Screen Shot - iPhone 13 Pro Max - 2021-11-17 at 10 32 30](https://user-images.githubusercontent.com/25160645/142156403-82063d72-ab3c-40b1-8441-0c32ecd7b708.png)
