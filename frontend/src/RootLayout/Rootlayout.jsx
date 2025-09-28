import React from 'react';
import Header from '../Pages/Header';
import Main from '../Pages/Main';
import Footer from '../Pages/Footer';


const Rootlayout = ({ children }) => {
  return (

    <div>
      <Header />
      <Main>{children}</Main>
      <Footer />
    </div>
  );
};

export default Rootlayout;
