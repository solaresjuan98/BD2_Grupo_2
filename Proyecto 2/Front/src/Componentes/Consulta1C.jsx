import { useContext, useEffect, useState } from "react";

import {
  Radio,
  Grid,
  Button,
  Text,
  Checkbox,
  Input,
  Row,
  useModal,
  Spacer,
  Modal,
} from "@nextui-org/react";
import { peticion } from "../helpers/fetch";

export const Consulta1C = () => {

  const [consultaMongo, setconsultaMongo] = useState();

  const [consultaMysql, setConsultaMysql] = useState([]);
  const [cargandoconsultaMongo, setcargandoconsultaMongo] = useState([]);


  const GetconsultaMysql = async () => {
    const resp = await peticion(
      "http://localhost:5000/mysql/1c",
      "",
      "GET"
    );
    console.log("mysql",resp);
    setConsultaMysql(resp.result);
  };
 
  const GetconsultaMongo = async () => {
    const resp = await peticion(
      "http://localhost:5000/mongo/1c",
      "",
      "GET"
    );
    console.log("mongo",resp);
    setconsultaMongo(resp.result);
  };

  useEffect(() => {
    GetconsultaMongo();
    GetconsultaMysql()
  }, [cargandoconsultaMongo]);
  return (
    <div>
        
        <Grid.Container gap={2} justify="flex-start">
    <Grid xs={6} sm={4} align="center" style={{"marginLeft":"200px"}}>
       
    <Grid.Container gap={2} justify="flex-start">

    <Grid xs={6} sm={6} align="center">
      <Text
        h1
        size={60}
        css={{
            textGradient: "45deg, $green600 -20%, $green600 50%",
        }}
        weight="bold"
      >
        MongoDB
      </Text>
      </Grid>
<Grid xs={8} sm={8} align="center">
      <table class="content-table">
        <thead>
          <th> <Text
                  h1
                  size={30}
                  css={{
                    textGradient: "45deg, $green600  -20%, $green600 100%",
                  }}
                  weight="bold"
                >
               Total pacientes
                </Text> </th>

              
        </thead>

      
            <tr>
              <td>
                <Text
                  h1
                  size={30}
                  css={{
                    textGradient: "45deg, black -20%, black 100%",
                  }}
                  weight="bold"
                >
                  {consultaMongo}
                </Text>
              </td>
        

           
            </tr>
         
      </table>
      </Grid>
      </Grid.Container>
     </Grid>  <Grid xs={6} sm={6} align="center" style={{"marginRight":"0px"}} >
       
       <Grid.Container gap={2} justify="flex-start">
   
       <Grid xs={8} sm={8} align="center">
         <Text
           h1
           size={60}
           css={{
               textGradient: "45deg, $blue600 -20%, $blue600 50%",
           }}
           weight="bold"
         >
           MYSQL
         </Text>
         </Grid>
   <Grid xs={8} sm={8} align="center">
         <table class="content-table">
           <thead>
             <th> <Text
                     h1
                     size={30}
                     css={{
                       textGradient: "45deg, $blue600  -20%, $blue600 100%",
                     }}
                     weight="bold"
                   >
                  Total Pacientes
                   </Text> </th>
   
                  
           </thead>
   
           {consultaMysql.map((item, i) => (
             <>
               <tr>
                
                 <td>
                   <Text
                     h1
                     size={30}
                     css={{
                       textGradient: "45deg, black -20%, black 100%",
                     }}
                     weight="bold"
                   >
                     {item.total_pacientes}
                   </Text>
                 </td>
                 
              
               </tr>
             </>
           ))}
         </table>
         </Grid>
         </Grid.Container>
        </Grid>
      </Grid.Container>
      
    </div>
  );
};
