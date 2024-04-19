#set heading(numbering: "1.")
#import "Class.typ": *
#show: ieee.with(
  title: [#text(smallcaps("Lab #3: Web Application with Genie"))],
  /*
  abstract: [
    #lorem(10).
  ],
  */
  authors:
  (
    
    (
      name: "Mohamed Bejaoui",
      department: [Dept. of EE],
      organization: [ISET Bizerte --- Tunisia],
      profile: "bejaouimohamed",
    ),
    (
      name: "Jamila Gharbi",
      department: [Dept. of EE],
      organization: [ISET Bizerte --- Tunisia],
      profile: "Gharbijamila",
    ),
  )
  // index-terms: (""),
  // bibliography-file: "Biblio.bib",
)

= Introduction
In this report, we will explain what we have done to add to the previous basic web application two extra sliders to change phase and offset which also modify the behaviour of the sine wave graph.
= Sine Wave Control
== Julia coding
To the previous app.jl file , we have add two inputs *phase* and *offset*.Its types are Float64 and Float32 and default value is 0. Also,we have add their names after  *onchange* so we can control them as we wish.
This work is shown in code below : 
#let code=read("../Codes/web-app/app.jl")
#raw(code, lang: "julia")
== HTML coding
For app.jl.html file, we have add two sliders :

=== The phase 
- Firstly , we have links the slider's value to a variable named *ph*.
- Secondly , we have sets the minimum value of the slider to $-pi$.
- Thridly , we have sets the maximum value of the slider to $pi$.
- Fourthly , we have sets the step increment of the slider to $pi/100$.
- In the end ,we specifies that labels should be displayed on the slider.
=== The offset
- Firstly , we have links the slider's value to a variable named *off*.
- Secondly , we have sets the minimum value of the slider to $-0.5$.
- Thridly , we have sets the maximum value of the slider to $1$.
- Fourthly , we have sets the step increment of the slider to $0.1$.
- In the end ,we specifies that labels should be displayed on the slider.
This is shown in the html code below :
#let code=read("../Codes/web-app/app.jl.html")
#raw(code, lang: "html")
== Graphical interface
After checking the app.jl and app.jl.html codes ,
we have open the terminal of vs code and open julia 
and tap the commands below to use the GenieFramework to develop a web application.
```julia
julia> using GenieFramework
julia> cd("C:/Users/bejao/OneDrive/Bureau/infodev-main/Codes/web-app")
julia> Genie.loadapp()
julia> up() 
```
`using GenieFramework`This line imports the GenieFramework module into the Julia environment, allowing you to access the functionality provided by the Genie web framework.
`cd("C:\\Users\\bejao\\OneDrive\\Bureau\\infodev-main\\Codes\\web-app")`This choose the current working directory in Julia to the specified path where your web application is located.
`Genie.loadapp()`This command loads the web application defined in the current directory into the Genie framework. It sets up the necessary configurations and initializes the application.
`up()`This command starts the web server, allowing our web application to be accessible through a web browser. Once the server is up and running,we can navigate to the specified URL to interact with our web application and control any parameters .

We can now open the browser and navigate to the link #highlight[#link("http://127.0.0.1:8000")[http://127.0.0.1:8000]]. We will get the updated graphical interface where we can control now plus the amplitude and frequency of the sine wave the phase and the offset as in @fig:genie-updated.

#figure(
	image("Images/Genie-sinewave.png", width: 100%, fit: "cover"),
	caption: "Genie -> Old Sine Wave",
) <fig:genie-webapp>

#figure(
	image("Images/2.png", width: 100%),
	caption: "Genie -> Updated Sine wave",
) <fig:genie-updated>


