cmake_minimum_required(VERSION 3.16)

project(calc_salary VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 6.5 REQUIRED COMPONENTS Quick Gui QuickControls2)

qt_standard_project_setup(REQUIRES 6.5)

qt_add_executable(appcalc_salary
    main.cpp
)

qt_add_qml_module(appcalc_salary
    URI calc_salary
    VERSION 1.0
    QML_FILES
        Main.qml
        Intro.qml
    SOURCES
        settings.h
        MainWindow.h
        MainWindow.cpp
        Popup.cpp
        resources.qrc

    RESOURCES
        images/atp.png
        images/dkk.png
        images/exit.png
        images/exit2.png
        images/greedyman.png
        images/krone.png
        images/money.png
        images/ok.png
        images/pension.png
        images/tax.png
        images/info.png
        images/intro.png
        Android/AndroidManifest.xml Android/build.gradle Android/res/values/libs.xml Android/res/xml/qtprovider_paths.xml Android/gradle/wrapper/gradle-wrapper.jar Android/gradle/wrapper/gradle-wrapper.properties Android/gradle.properties Android/gradlew Android/gradlew.bat
        Android/res/drawable/splashscreen.xml
        Android/res/values/splashscreentheme.xml
        images/salary.png
        Android/res/values/style.xml
        images/dk_map.png
        images/danish_flag.png
        images/danish_flag.png
        images/dk.png

        fonts/Expansiva.otf
        fonts/ExpansivaBold.otf
        fonts/ExpansivaBoldItalic.otf
        fonts/ExpansivaItalic.otf
        fonts/ArtsyNight.otf
        fonts/ROSEMERO.ttf
        RESOURCES fonts/ArtsyNight.otf fonts/Expansiva.otf fonts/ExpansivaBold.otf fonts/ExpansivaBoldItalic.otf fonts/ExpansivaItalic.otf fonts/fontstyle fonts/ROSEMERO.ttf
        RESOURCES images/title.png
        RESOURCES images/salary_png.png
        RESOURCES images/salary_png.png
        RESOURCES images/pension_png.png
        RESOURCES images/atp_png.png
        RESOURCES images/askat.png
        RESOURCES images/salary_png.png
        RESOURCES images/pension_png.png
        RESOURCES images/ferie.png
        RESOURCES images/dkk.png
        RESOURCES images/salary.png

)

# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(appcalc_salary PROPERTIES
#    MACOSX_BUNDLE_GUI_IDENTIFIER com.example.appcalc_salary
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
    #to open alternative splashcreen via its android source way
    QT_ANDROID_PACKAGE_SOURCE_DIR ${CMAKE_CURRENT_SOURCE_DIR}/android

)

target_link_libraries(appcalc_salary
    PRIVATE Qt6::Quick Qt6::Gui Qt::QuickControls2#Qt::CorePrivate

)

include(GNUInstallDirs)
install(TARGETS appcalc_salary
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)

list(APPEND QML_IMPORT_PATH "C:/Qt/Tools/QtDesignStudio/qt6_design_studio_reduced_version/qml/QtQuick/Studio/DesignEffects")


# Prevent adding duplicate values at each run of CMake.
list(REMOVE_DUPLICATES QML_IMPORT_PATH)

# The variable is cached in ${BUILD_DIR}/CMakeCache.txt. We need FORCE to
# change it there immediately. Also, add a comment to the cache file.
set(QML_IMPORT_PATH ${QML_IMPORT_PATH}
    CACHE STRING "Qt qml design effects"
    FORCE
)

