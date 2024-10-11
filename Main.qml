import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Dialogs
import QtQuick.Layouts
import Qt5Compat.GraphicalEffects



Window {
    id: window
    width: 1080
    height: 1940
    visible: true

    color: "#fdc2ff"
    //-------------------title ------------------------//
    Rectangle {
        id: rectangle
        width: parent.width
        height: parent.height*0.05


        border.color: "#000000"

        gradient: Gradient {
            GradientStop { position: 1; color: "#c9c9c7" }
            GradientStop { position: 0; color: "#4a4a49" }
        }

        Image {
            id: title
            x: parent.width/2-width/2
            y: parent.height/2-height*0.48
            width: window.width
            height:window.height*0.3
            source: "images/title.png"
            fillMode: Image.PreserveAspectFit
        }

    }




    //--------------------------------box with outcome calculation-------------------------//
    Rectangle {
        id: rectangle1
        x: parent.x
        y: parent.height*0.08
        width: parent.width
        height: parent.height*0.45
        color: "steelblue"
        gradient: Gradient {
            GradientStop { position: 0.0; color: "#858585" }
            GradientStop { position: 1.0; color: "#5af549" }
        }
        radius: 20
        border.color: "lime"
        border.width: 1
        Rectangle{
            x: 0
            y: 0
            //width: parent.width/2
            //height: parent.height/2
            Image {
                id: dk_map
                x: 0
                y: 0
                width: window.width*0.5
                height: window.width*0.5
                source: "images/danish_flag.png"
                fillMode: Image.PreserveAspectFit
            }
        }

        DropShadow {
            anchors.fill: salary_outcom
            horizontalOffset: 5
            verticalOffset: 5
            spread: 0.1
            radius: 8
            color: "#80000000"
            source: salary_outcom
        }

        Text {

            id: salary_outcom
            x: parent.width*0.4
            y: parent.height*0.1
            width: parent.width*0.5
            height: parent.height*0.15
            visible: true
            color: "#000000"
            text: qsTr("0")

            font.pixelSize: parent.width/6

            horizontalAlignment: Text.AlignRight
            verticalAlignment: Text.AlignVCenter
            //font.styleName: "Regular"


        }

        Connections{
            target: mainwindow
            onEmitSignal: {
                salary_outcom.text = Outcom
                //salary.font.pixelSize = rectangle1.width/10
                salary_outcom.color = "#0600ad"
                console.log(Outcom)
            }
        }


        Image {
            id: greedyman
            x: parent.x
            y: parent.height*0.4
            width: parent.width*0.5
            height: parent.height*0.5
            source: "images/greedyman.png"
            fillMode: Image.PreserveAspectFit
        }

        DropShadow {
            anchors.fill: ferie_value
            horizontalOffset: 5
            verticalOffset: 5
            //spread: 0.1
            radius: 8
            color: "#80000000"
            source: ferie_value
        }
        Text {
            id: ferie_value
            x: parent.width*0.65
            y: parent.height*0.8
            width: parent.width*0.3
            height: parent.height*0.1
            color: "#000000"
            text: qsTr("0")
            font.pixelSize: parent.height/15
            horizontalAlignment: Text.AlignRight
            verticalAlignment: Text.AlignVCenter
        }

        Connections{
            target: mainwindow
            onEmitSignal2: {
                ferie_value.text = Ferie_money
                //salary.font.family = "JetBrains Mono"
                ferie_value.color = "#0f00ff"
                console.log(Outcom)
            }
        }

        Image {
            id: ferie
            x: parent.width*0.55
            y: parent.height*0.7
            width: parent.width*0.4
            height: parent.height*0.1
            source: "images/ferie.png"
            fillMode: Image.PreserveAspectFit
        }

        Image {
            id: dkk
            x: parent.width*0.6
            y: parent.height*0.4
            width: parent.width*0.35
            height: parent.height*0.2
            source: "images/dkk.png"
            fillMode: Image.PreserveAspectFit
        }

    }
    //--------------------------------box with input area --------------------------------//
    Rectangle {
        id: rectangle2
        x: 0
        y: parent.height*0.55
        width: parent.width
        height: parent.height*0.45
        color: "#fdc2ff"
        //radius: 10
        //border.color: "black"
        //border.width: 1


        /*----------salary row -------------------------*/
        Rectangle {
            id: row1
            x: 0
            y: parent.height*0.05
            width: parent.width
            height: parent.height*0.2
            //radius: 10
            //border.color: "black"
            //border.width: 1
            gradient: Gradient {
                GradientStop { position: 1; color: "#fa652a" }
                GradientStop { position: 0; color: "#5af549" }
            }

            Rectangle {
                id: textEditBackground_salary
                x: parent.width * 0.45
                y: parent.height * 0.25
                width: parent.width * 0.4
                height: parent.height * 0.5
                color: "lightgray"  // Background color for the frame
                radius: 5           // Rounded corners, if needed
                border.color: "black"   // Border color
                border.width: 2     // Border width

                TextEdit {
                    id: textEdit_salary
                    anchors.fill: parent  // Fill the Rectangle
                    text: "Edit salary"
                    anchors.leftMargin: 10
                    horizontalAlignment: TextEdit.AlignHCenter
                    verticalAlignment: TextEdit.AlignVCenter
                    font.pixelSize: parent.width/14
                    color: "black"

                    MouseArea{
                        id: salary_input
                        anchors.fill: parent
                        onClicked:{
                            popup_salary.open()
                        }
                    }
                }
            }

            /*------------------pop up msg for salary --------------------*/
            Popup {
                id: popup_salary
                parent: Overlay.overlay
                //anchors.centerIn: Overlay.overlay
                x: (window.width- window.width*0.75)/2
                y: window.height/3
                width: window.width*0.75
                height: window.height/4
                modal: true
                focus: true
                closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutsideParent

                background:
                    Rectangle {
                    color: "lightblue"
                    border.color: "blue"
                    border.width: 2
                    radius: 10
                }


                Text {
                    x: (parent.width - width)*0.5
                    y: parent.height*0.1
                    width: parent.width*0.5
                    height: parent.height*0.1
                    text: "Type your wage"
                    color: "black"
                    font.pointSize: parent.width/18
                    horizontalAlignment: Text.AlignHCenter
                    //verticalAlignment: parent.AlignVCenter
                }

                Button {
                    id: button_salary_aprove
                    x: parent.width*0.85
                    y: parent.height*0.7
                    width: parent.width*0.15
                    height: parent.height*0.3
                    icon.cache: false
                    icon.height: 50
                    icon.width: 50
                    icon.color: "#00000000"
                    icon.source: "images/ok.png"
                    onClicked: {

                        mainwindow.get_salary(parseInt(textEdit_salary_inp.text))
                        console.log(textEdit_salary_inp.text, typeof(parseInt(textEdit_salary_inp.text)))

                        textEdit_salary.text = textEdit_salary_inp.text
                        textEdit_salary.horizontalAlignment = TextEdit.AlignHCenter
                        textEdit_salary.color = "green"
                        popup_salary.close()
                    }

                }
                Rectangle {

                    x: parent.width * 0.1
                    y: parent.height * 0.45
                    width: parent.width * 0.8
                    height: parent.height * 0.2
                    color: "lightgray"  // Background color for the frame
                    radius: 5           // Rounded corners, if needed
                    border.color: "blue"   // Border color
                    border.width: 1


                    TextInput{
                        id: textEdit_salary_inp
                        anchors.fill: parent  // Fill the Rectangle
                        horizontalAlignment: TextEdit.AlignHRight
                        //x: parent.width*0.25
                        //y: parent.heignt/2-height/2
                        verticalAlignment: TextEdit.AlignVCenter
                        font.pixelSize: 18
                        color: "black"
                        cursorVisible: true
                        validator: IntValidator{bottom: 0; top: 1000000}
                        onActiveFocusChanged: {
                            popup_salary.y = window.height/3 -50;
                        }
                    }
                }
            }

            Image {
                id: money
                x: parent.width*0.85
                y: parent.height*0.1
                width: parent.width*0.15
                height: parent.height*0.75
                source: "images/money.png"
                fillMode: Image.PreserveAspectFit
            }

            Image {
                id: salary_png
                x: parent.width*0.05
                y: (parent.height-height)/2
                width: parent.width*0.3
                height: parent.width*0.1
                source: "images/salary_png.png"
                fillMode: Image.PreserveAspectFit
            }
        }

        /*--------------- pension row------------------------*/
        Rectangle {
            id: row2
            x: parent.x
            y: parent.height*0.25
            width: parent.width
            height: parent.height*0.2
            //radius: 10
            //border.color: "black"
            //border.width: 1
            gradient: Gradient {
                GradientStop { position: 1; color: "#fc00f4" }
                GradientStop { position: 0; color: "#fa652a" }
            }
            Image {
                id: pension_png
                x: parent.width*0.05
                y: (parent.height-height)/2
                width: parent.width*0.35
                height: parent.width*0.1
                source: "images/pension_png.png"
                fillMode: Image.PreserveAspectFit
            }

            Rectangle {
                id: textEditBackground_pension
                x: parent.width * 0.45
                y: parent.height * 0.25
                width: parent.width * 0.4
                height: parent.height * 0.5
                color: "lightgray"  // Background color for the frame
                radius: 5           // Rounded corners, if needed
                border.color: "black"   // Border color
                border.width: 2     // Border width

                TextEdit {
                    id: textEdit_pension
                    text: "Edit"
                    anchors.fill: parent  // Fill the Rectangle
                    anchors.leftMargin: 10
                    horizontalAlignment: TextEdit.AlignHCenter
                    verticalAlignment: TextEdit.AlignVCenter
                    font.pixelSize: parent.width/14
                    color: "black"  // Text color
                    MouseArea{

                        anchors.fill: parent
                        onClicked:{
                            popup_pension.open()
                        }
                    }
                }
            }
            /*------------------pop up msg for pension--------------------*/
            Popup {
                id: popup_pension
                //anchors.centerIn: Overlay.overlay
                parent: Overlay.overlay
                x: (window.width - window.width*0.75)/2
                y: window.height/3
                width: window.width*0.75
                height: window.height/4
                modal: true
                focus: true
                closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutsideParent

                background:
                    Rectangle {
                    color: "lightblue"
                    border.color: "blue"
                    border.width: 2
                    radius: 10

                }

                Text {
                    id:pens_line
                    //x: popup_salary.width*0.2
                    //y: popup_salary.height*0.1

                    x: (parent.width - width)*0.5//popup_pension.width*0.2
                    y: popup_pension.height*0.1
                    width: parent.width/2
                    height: popup_pension.height*0.1
                    text: "Type our pension investment "
                    color: "black"
                    font.pointSize: parent.width/18
                    horizontalAlignment: Text.AlignHCenter
                    //verticalAlignment: TextEdit.AlignVCenter
                }
                Button {
                    id: button_salary_aprove1
                    x: parent.width*0.85
                    y: parent.height*0.7
                    width: parent.width*0.15
                    height: parent.height*0.3
                    icon.cache: false
                    icon.height: 50
                    icon.width: 50
                    icon.color: "#00000000"
                    icon.source: "images/ok.png"
                    onClicked: {

                        mainwindow.get_pension(parseInt(textEdit_pension_inp.text))
                        textEdit_pension.text  =  textEdit_pension_inp.text
                        textEdit_pension.horizontalAlignment = TextEdit.AlignHCenter
                        textEdit_pension.color = "green"
                        popup_pension.close()
                    }
                }
                Rectangle {
                    x: parent.width * 0.1
                    y: parent.height * 0.45
                    width: parent.width * 0.8
                    height: parent.height * 0.2
                    color: "lightgray"  // Background color for the frame
                    radius: 5           // Rounded corners, if needed
                    border.color: "blue"   // Border color
                    border.width: 1     // Border width


                    TextInput {
                        id: textEdit_pension_inp
                        anchors.fill: parent  // Fill the Rectangle
                        horizontalAlignment: TextEdit.AlignHRight
                        verticalAlignment: TextEdit.AlignVCenter
                        font.pixelSize: 14
                        color: "black"
                        cursorVisible: true
                        validator: IntValidator{bottom: 0; top: 1000000}
                        onActiveFocusChanged: {
                            popup_pension.y = window.height/3 -50;
                        }
                    }

                }
            }

            Image {
                id: pension
                x: parent.width*0.88
                y: parent.height*0.18
                width: parent.width*0.1
                height: parent.height*0.65
                source: "images/pension.png"
                fillMode: Image.PreserveAspectFit
            }

        }
        /*--------------- atp row-----------------------------*/
        Rectangle {
            id: row3
            x: parent.x
            y: parent.height*0.45
            width: parent.width
            height: parent.height*0.2
            //radius: 10
            //border.color: "black"
            //border.width: 1
            gradient: Gradient {
                GradientStop { position: 1; color: "#ffc4fd" }
                GradientStop { position: 0; color: "#fc00f4" }
            }

            Rectangle {
                id: textEditBackground_atp
                x: parent.width * 0.45
                y: parent.height * 0.25
                width: parent.width * 0.4
                height: parent.height * 0.5
                color: "lightgray"  // Background color for the frame
                radius: 5           // Rounded corners, if needed
                border.color: "black"   // Border color
                border.width: 2     // Border width



                TextEdit {
                    id: textEdit_atp
                    anchors.fill: parent  // Fill the Rectangle
                    anchors.leftMargin: 10
                    text: qsTr("99 dkk")
                    horizontalAlignment: TextEdit.AlignHCenter
                    verticalAlignment: TextEdit.AlignVCenter
                    font.pixelSize: parent.width/14
                    color: "black"  // Text color
                    MouseArea{

                        anchors.fill: parent
                        onClicked:{
                            popup_atp.open()
                        }
                    }
                }
            }
            /*------------------pop up msg for atp--------------------*/
            Popup {
                id: popup_atp
                //anchors.centerIn: Overlay.overlay
                parent: Overlay.overlay
                x:(window.width- window.width*0.75)/2
                y: window.height/3
                width: window.width*0.75
                height: window.height/4
                modal: true
                focus: true
                closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutsideParent

                background:
                    Rectangle {
                    color: "lightblue"
                    border.color: "blue"
                    border.width: 2
                    radius: 10
                }

                Text {
                    x: (parent.width - width)*0.49
                    y: parent.height*0.1
                    width: parent.width/2
                    height: parent.height*0.1
                    font.pointSize: parent.width/18
                    text: " ATP, remain 99 dkk"
                    color: "black"
                    horizontalAlignment: Text.AlignHCenter
                    //verticalAlignment: TextEdit.AlignVCenter

                }
                Button {
                    id: button_salary_aprove2
                    x: parent.width*0.85
                    y: parent.height*0.7
                    width: parent.width*0.15
                    height: parent.height*0.3
                    icon.cache: false
                    icon.height: 50
                    icon.width: 50
                    icon.color: "#00000000"
                    icon.source: "images/ok.png"
                    onClicked: {
                        //mainwindow.salary =
                        mainwindow.get_atp(parseInt(textEdit_atp_inp.text))
                        textEdit_atp.text = textEdit_atp_inp.text
                        textEdit_atp.horizontalAlignment = TextEdit.AlignHCenter
                        textEdit_atp.color = "green"
                        popup_atp.close()
                    }

                }
                Rectangle {
                    x: parent.width * 0.1
                    y: parent.height * 0.45
                    width: parent.width * 0.8
                    height: parent.height * 0.2
                    color: "lightgray"  // Background color for the frame
                    radius: 5           // Rounded corners, if needed
                    border.color: "blue"   // Border color
                    border.width: 1     // Border width


                    TextInput {
                        id: textEdit_atp_inp
                        anchors.fill: parent  // Fill the Rectangle
                        text: qsTr("99 dkk")
                        horizontalAlignment: TextEdit.AlignHRight
                        verticalAlignment: TextEdit.AlignVCenter
                        font.pixelSize: 14
                        color: "black"
                        cursorVisible: true
                        validator: IntValidator{bottom: 0; top: 1000000}
                        onActiveFocusChanged: {
                            popup_atp.y = window.height/3 -50;
                        }
                    }

                }
            }

            Image {
                id: atp
                x: parent.width*0.88
                y: parent.height*0.18
                width: parent.width*0.1
                height: parent.height*0.65
                source: "images/atp.png"
                fillMode: Image.PreserveAspectFit
            }

            Image {
                id: atp_png
                x: parent.width*0.05
                y: (parent.height-height)/2
                width: parent.width*0.2
                height: parent.width*0.1
                source: "images/atp_png.png"
                fillMode: Image.PreserveAspectFit
            }

        }
        /*--------------- fradrag row--------------------------*/
        Rectangle {
            id: row4
            x: parent.x
            y: parent.height*0.65
            width: parent.width
            height: parent.height*0.2
            //radius: 10
            //border.color: "black"
            //border.width: 1
            gradient: Gradient {
                GradientStop { position: 1; color: "#be00f8fe" }
                GradientStop { position: 0; color: "#ffc4fd" }
            }

            Image {
                id: askat
                x: parent.width*0.05
                y: (parent.height-height)/2
                width: parent.width*0.4
                height: parent.width*0.15
                source: "images/askat.png"
                fillMode: Image.PreserveAspectFit
            }

            Rectangle {
                id: textEditBackground_fradrag
                x: parent.width * 0.45
                y: parent.height * 0.25
                width: parent.width * 0.4
                height: parent.height * 0.5
                color: "lightgray"  // Background color for the frame
                radius: 5           // Rounded corners, if needed
                border.color: "black"   // Border color
                border.width: 2     // Border width

                TextEdit {
                    id: textEdit_fradrag
                    anchors.fill: parent  // Fill the Rectangle
                    anchors.leftMargin: 10
                    text: qsTr("Edit fradrag")
                    horizontalAlignment: TextEdit.AlignHCenter
                    verticalAlignment: TextEdit.AlignVCenter
                    font.pixelSize: parent.width/14
                    color: "black"  // Text color
                    MouseArea{

                        anchors.fill: parent
                        onClicked:{
                            popup_fradrag.open()
                        }
                    }
                }


                /*------------------pop up msg for fradrag--------------------*/
                Popup {
                    id: popup_fradrag
                    //anchors.centerIn: Overlay.overlay
                    parent: Overlay.overlay
                    x: (window.width- window.width*0.75)/2
                    y: window.height/3
                    width: window.width*0.75
                    height: window.height/4
                    modal: true
                    focus: true
                    closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutsideParent

                    background:
                        Rectangle {
                        color: "lightblue"
                        border.color: "blue"
                        border.width: 2
                        radius: 10

                    }

                    Text {
                        x: (parent.width - width)*0.5
                        y: parent.height*0.1
                        width: parent.width/2
                        height: parent.height*0.1
                        font.pointSize: parent.width/18
                        text: "Type your fradrag value"
                        color: "black"
                        horizontalAlignment: Text.AlignHCenter
                        //verticalAlignment: TextEdit.AlignVCenter
                    }
                    Button {
                        id: button_salary_aprove3
                        x: parent.width*0.85
                        y: parent.height*0.7
                        width: parent.width*0.15
                        height: parent.height*0.3
                        icon.cache: false
                        icon.height: 50
                        icon.width: 50
                        icon.color: "#00000000"
                        icon.source: "images/ok.png"
                        onClicked: {

                            mainwindow.get_fradrag((textEdit_fradrag_inp.text))
                            textEdit_fradrag.text = (textEdit_fradrag_inp.text)
                            textEdit_fradrag.horizontalAlignment = TextEdit.AlignHCenter
                            textEdit_fradrag.color = "green"
                            popup_fradrag.close()
                        }

                    }
                    Rectangle {
                        x: parent.width * 0.1
                        y: parent.height * 0.45
                        width: parent.width * 0.8
                        height: parent.height * 0.2
                        color: "lightgray"  // Background color for the frame
                        radius: 5           // Rounded corners, if needed
                        border.color: "blue"   // Border color
                        border.width: 1     // Border width


                        TextInput {
                            id: textEdit_fradrag_inp
                            anchors.fill: parent  // Fill the Rectangle
                            horizontalAlignment: TextEdit.AlignHRight
                            verticalAlignment: TextEdit.AlignVCenter
                            font.pixelSize: 14
                            color: "black"
                            cursorVisible: true
                            validator: IntValidator{bottom: 0; top: 1000000}
                            onActiveFocusChanged: {
                                popup_fradrag.y = window.height/3 -50;
                            }
                        }

                    }
                }

            }

            Image {
                id: tax
                x: parent.width*0.88
                y: parent.height*0.18
                width: parent.width*0.1
                height: parent.height*0.65
                visible: true
                source: "images/tax.png"
                fillMode: Image.PreserveAspectFit
            }
        }
        /*--------------- buttons count reset------------------*/
        Rectangle {
            id: row5
            x: parent.x
            y: parent.height*0.85
            width: parent.width
            height: parent.height*0.15
            //radius: 5
            //border.color: "black"
            //border.width: 1
            gradient: Gradient {
                GradientStop { position: 1; color: "#c9c9c7" }
                GradientStop { position: 0; color: "#be00f8fe" }
            }


            Button {
                id: button_count
                x: parent.width*0.2
                y: parent.height*0.1
                width: parent.width*0.25
                height: parent.height*0.9
                text: qsTr("Count")
                onClicked: {
                    mainwindow.count_wage()
                }

            }
            Button {
                id: button_reset
                x: parent.width*0.55
                y: parent.height*0.1
                width: parent.width*0.25
                height: parent.height*0.9
                text: qsTr("Reset")
                onClicked: {
                    mainwindow.reset()
                    salary_outcom.text = "0"
                    ferie_value.text = "0"
                    //salary_input.text = "0"
                    textEdit_salary_inp.text = ""
                    textEdit_atp_inp.text = ""
                    textEdit_pension_inp.text = ""
                    textEdit_fradrag_inp.text = ""
                    textEdit_salary.text = "0 dkk"
                    textEdit_salary.color = "grey"
                    textEdit_atp.text = "0 dkk"
                    textEdit_atp.color = "grey"
                    textEdit_pension.text = "0 dkk"
                    textEdit_pension.color = "grey"
                    textEdit_fradrag.text = "0 dkk"
                    textEdit_fradrag.color = "grey"
                }
            }

            Button {

                Text{
                    text: "->"
                    anchors.centerIn: parent
                    font.pixelSize: row5.width/20

                }
                id: button
                x: parent.width*0.9
                y: parent.height*0.1
                width: parent.width*0.1
                height: parent.height*0.9
                //icon.height:150
                //icon.width: 150
                //icon.color: "#00000000"
                //icon.source: "images/exit2.png"
                onClicked:{
                    Qt.quit()
                }
            }
            Button {
                Text{
                    text: "i"
                    anchors.centerIn: parent
                    font.pixelSize: row5.width/20
                    font.italic: true

                }
                //font.italic: true


                id: button_info
                x: 0
                y: parent.height*0.1
                width: parent.width*0.1
                height: parent.height*0.9

                /*background:
                    Image {
                    source: "images/info.png"
                    width: parent.width*0.75
                    height: parent.width*0.75
                }*/


                // icon.name: "info"
                // icon.height: parent.implisitHeight
                // icon.width: parent.implicitWidth
                // icon.color: "#00000000"
                //icon.source: "images/info.png"
                onClicked:{
                    info_dialog.open()
                }
                /*Image {
                    id: info_icon
                    x: parent.width/2-width/2
                    y: parent.height*0.5-height*0.5
                    width: parent.width*0.75
                    height: parent.height*0.75
                    visible: true
                    source: "images/info.png"
                    fillMode: Image.PreserveAspectFit
                }*/

            }
            MessageDialog {

                id: info_dialog
                text: "Get know a net salary after tax deduction."
                informativeText: "
Type your personal data in following text fields:\n
- input gross salary.\n
- Pension Investments. Enter the amount of invests in pension funds. If not applicable, they can set this value to 0.\n
- ATP (Arbejdsmarkedets Tillægspension): This is a fixed value (99 DKK for the year 2024), leave this field or enter 0.\n
- Personal Tax Deduction Level (“fradrag” in Danish).\n
This app does not collect any personal information. \n

With best regards, developer."

                buttons: MessageDialog.Ok

                onButtonClicked: {
                    info_dialog.close()
                }
            }

        }
    }

}






