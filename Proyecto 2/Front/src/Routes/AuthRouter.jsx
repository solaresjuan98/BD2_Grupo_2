import React from 'react';

import { Routes, Route ,Navigate} from "react-router-dom"

import { Bienvenida } from '../pages/Bienvenida';

export const AuthRouter = () => {
    return (

        <div >
            <div >
                <div>
                    <Routes>
                
                        <Route path="/" element={<Bienvenida/>} />
                        
                        <Route path="/bienvenida" element={<Bienvenida />} />
       
                        <Route path="*" element={<h>La página no existe</h>} />
                    </Routes>
                </div>
            </div>
        </div>

    );
};