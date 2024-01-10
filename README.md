<h1>Speedometer Application</h1>

<p>This Qt Quick application simulates a speedometer with left and right indicators, accelerator and brake buttons, and additional features.</p>

<img src="https://github.com/Gauravhcu2022/Qt_Speedometer/assets/140634022/c9b8b0a8-5b7d-4cf4-8496-a7491d6cea22" height ="800" width ="1000">



<h3>Table of Contents</h3>
<p>
    Introduction<br>
    Features<br>
    Getting Started<br>
    ----Prerequisites<br>
    ----Installation<br>
    Usage<br>
    Configuration<br>
    Future Changes
 
</p>
<h3>Introduction</h3>

<p>The Speedometer Application is a Qt Quick project that provides a graphical representation of a speedometer. It includes features such as a needle indicating speed, left and right indicators with blinking functionality, accelerator and brake buttons, and the capability to reduce speed automatically.</p>
<h3>Features </h3>
<p>
 -- Speedometer with a dynamic needle indicating speed.<br>
 --   Left and right indicators with blinking functionality.<br>
 --   Accelerator and brake buttons to control the speed.<br>
 --   Auto speed reduction by 0.5 km/h per second when the accelerator button is released.</p>
    
    

<h3>Getting Started</h3>
<h4>Prerequisites</h4>

<p>Before using the Speedometer Application, ensure you have the following prerequisites:</p>

<p>    Qt 6.6.1 </p>

<h4>Installation</h4>

   <p>Clone the repository:</p>
    
    git clone https://github.com/Gauravhcu2022/Speedometer.git

   <p>Open the project in Qt Creator.</p>

   <p> Build and run the application.(May be image of speedometer not displayed so follow below steps)</p>
   <p>It will give error:</p>
   <p>qrc:/qt/qml/Main/main.qml:16:5: QML QQuickImage: Cannot open: qrc:/qt/qml/Main/speedometer_background.png</p>
   <p>Means you have to add all other files in qrc file, Here having steps how to do that:</p>
   <p>Go to left side of Qt Creator and in edit you saw project files go through <b> SpeedometerApp[main]/SpeedometerApp/Build_Directory/.rcc </b> </p>
       <p>Then you saw <b>SpeedometerApp_raw_qml_0.qrc </b> folder press right click and open with Plain Text Editor and remove all and paste this:</p>
      
<pre>
&lt;RCC&gt;
  &lt;qresource prefix="/qt/qml/Main/"&gt;
    &lt;file alias="main.qml"&gt;/home/gaurav/Speedometer/main.qml&lt;/file&gt;
  &lt;/qresource&gt;
  &lt;qresource prefix="/qt/qml/Main/"&gt;
    &lt;file alias="speedometer_background.png"&gt;/home/gaurav/Speedometer/speedometer_background.png&lt;/file&gt;
  &lt;/qresource&gt;
  &lt;qresource prefix="/qt/qml/Main/"&gt;
    &lt;file alias="accerator.mp3"&gt;/home/gaurav/Speedometer/accerator.mp3&lt;/file&gt;
  &lt;/qresource&gt;
  &lt;qresource prefix="/qt/qml/Main/"&gt;
    &lt;file alias="brake.mp3"&gt;/home/gaurav/Speedometer/brake.mp3&lt;/file&gt;
  &lt;/qresource&gt;
  &lt;qresource prefix="/qt/qml/Main/"&gt;
    &lt;file alias="indicator.mp3"&gt;/home/gaurav/Speedometer/indicator.mp3&lt;/file&gt;
  &lt;/qresource&gt;
  &lt;qresource prefix="/qt/qml/Main/"&gt;
    &lt;file alias="running.mp3"&gt;/home/gaurav/Speedometer/running.mp3&lt;/file&gt;
  &lt;/qresource&gt;
&lt;/RCC&gt;
</pre>

      

<h3>Usage</h3>

  <p>  Once the application is running, you can interact with the speedometer using the following controls:</p>

   <p> <b>Brake Button:</b> Click or press the "Brake" button to apply brakes and decrease speed. If you don't want to use brake button it will automatically decreases speed through auto-reduction. </p>

   <p><b> Accelerator Button:</b> Click or press the "Accelerator" button to increase speed. Release the button to start auto speed reduction.</p>

   <p><b> Left Indicator Button:</b> Click the "Left Indicator" button to activate the left indicator arrow it will first pause the right indicator if applied. Click the "Off Indicator" button to turn it off.</p>

   <p> <b>Right Indicator Button:</b> Click the "Right Indicator" button to activate the right indicator arrow it will first pause the left indicator if applied. Click the "Off Indicator" button to turn it off.</p>
   <p><b>Off Indicator Button:</b> Click the "Off Indicator" button to off the indicator whenever you don't want indicator.</p>

<h3>Configuration</h3>

<p>There are no additional configuration options for this application.</p>
<h3>Future Changes</h3>
<p>I have to add multimedia to make speedometer more interactive thats why i already paste audio for running, brake, accerator and indicator but right now, I don't have license to use multimedia property properly. </p>
