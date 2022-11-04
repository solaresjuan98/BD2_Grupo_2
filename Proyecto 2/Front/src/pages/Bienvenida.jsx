import { useForm } from "../hooks/useForm";

import {
  Input,
  Grid,
  Row,
  Button,
  Text,
  Link,
  Modal,
  useModal,
  Spacer,
} from "@nextui-org/react";

import { useContext, useEffect, useState } from "react";

import { AuthContext } from "../Context/AuthContext";

import Box from "@mui/material/Box";
import Tab from "@mui/material/Tab";
import TabContext from "@mui/lab/TabContext";
import TabList from "@mui/lab/TabList";
import TabPanel from "@mui/lab/TabPanel";
import { Consulta1A } from "../Componentes/Consulta1A";
import { Consulta1B } from "../Componentes/Consulta1B";
import { Consulta1C } from "../Componentes/Consulta1C";
import { Consulta2 } from "../Componentes/Consulta2";
import { Consulta3 } from "../Componentes/Consulta3";
import { Consulta4 } from "../Componentes/Consulta4";
import { Consulta5 } from "../Componentes/Consulta5";
import { Consulta6 } from "../Componentes/Consulta6";
import { Consulta7 } from "../Componentes/Consulta7";
import { Consulta8 } from "../Componentes/Consulta8";
export const Bienvenida = () => {
  const [pestañasTotales, setPestañasTotales] = useState([]);
  const { auth } = useContext(AuthContext);

  const [cargarPestaña] = useState(false);
  const [ruta, setUrl] = useState("");
  const [bienvenida, setBienvenida] = useState(false);


  const [value, setValue] = useState("1");
  const [page, setPage] = useState(1);
  const handleChange = (event, newValue) => {
    setValue(newValue);
  };

  let alv = [
    {
      nombre: "Inicio",
      valor: "1",
    },
 
    {
      nombre: "Consulta 1A",
      valor: "3",
    },
    {
      nombre: "Consulta 1B",
      valor: "4",
    },
    {
      nombre: "Consulta 1C",
      valor: "5",
    },
    {
      nombre: "Consulta 2",
      valor: "6",
    },
    {
      nombre: "Consulta 3",
      valor: "7",
    },
    {
      nombre: "Consulta 4",
      valor: "8",
    },
    {
      nombre: "Consulta 5",
      valor: "9",
    },
    {
      nombre: "Consulta 6",
      valor: "10",
    },{
      nombre: "Consulta 7",
      valor: "11",
    },
    ,{
      nombre: "Consulta 8",
      valor: "12",
    },
  ];
  const borrar = () => {};
  const [selectedSize, setSelectedSize] = useState("md");

  const { values, handleInputChange } = useForm({
    pagina: 0,

    ruta: "",
  });
  const Salir = async () => {
  localStorage.removeItem("token") 
  window.location.reload()
  }
  useEffect(() => {
    console.log("auth", auth);
    if (auth.logged===true){
      const url = process.env.URL;
      setUrl(url);
    const pestaña = [{ nombre: "Inicio", valor: "1" }];
    const filteredArray = auth.roles.filter(function (ele, pos) {
      return auth.roles.indexOf(ele) == pos;
    });

    setPestañasTotales(filteredArray);}
    else{
      setPestañasTotales(alv)
    

    }

    //  console.log(auth.roles)

    console.log("PESTAÑAS", pestañasTotales);
  }, [cargarPestaña]);

  function set() {
    setBienvenida(true);
  }

  return (
    <div class="MenuPortal">
     
      <Grid.Container gap={1} justify="flex-start">
        <Grid xs={12} sm={12} align="center" style={{"marginLeft":"-120px"}}>
          <Box
            sx={{
              width: "3000px",
              padding: "20px",
              height: 100,
              typography: "body1",
            }}
          >
            <TabContext value={value}>
              <Box sx={{ borderBottom: 1, borderColor: "divider" }}>
                <TabList
                  sx={{
                    width: "4000",
                    padding: "0px",
                    height: 0,
                    typography: "body1",
                    margin: "auto",
                  }}
                  indicatorColor="black"
                  onChange={handleChange}
                  aria-label="lab API tabs example"
                >
                  {
                  alv.map((item, i) => (
                    <Tab label={item.nombre} value={item.valor} />
                  ))}
                </TabList>
              </Box>
              
              <TabPanel value="1">
                {" "} 
         
              </TabPanel>
              <TabPanel value="3">
                {" "} 
                
                <Consulta1A></Consulta1A>
         
              </TabPanel> 
              <TabPanel value="4">
                {" "} 
                
                <Consulta1B></Consulta1B>
         
              </TabPanel>
              <TabPanel value="5">
                {" "} 
                
                <Consulta1C></Consulta1C>
         
              </TabPanel>
              <TabPanel value="6">
                {" "} 
                
                <Consulta2></Consulta2>
         
              </TabPanel>
              <TabPanel value="7">
                {" "} 
                <Consulta3></Consulta3>
         
              </TabPanel>
              <TabPanel value="8">
                {" "} 
                <Consulta4></Consulta4>
         
              </TabPanel>
              <TabPanel value="9">
                {" "} 
                <Consulta5></Consulta5>
         
              </TabPanel>
              <TabPanel value="10">
                {" "} 
                <Consulta6></Consulta6>
         
              </TabPanel>
              <TabPanel value="11">
                {" "} 
                <Consulta7></Consulta7>
         
              </TabPanel>
              <TabPanel value="12">
                {" "} 
                <Consulta8></Consulta8>
         
              </TabPanel>
            </TabContext>
          </Box>
        </Grid>
      </Grid.Container>
    </div>
  );
};
