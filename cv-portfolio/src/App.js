import './App.css';
import { ChakraProvider } from "@chakra-ui/react"
import extendedTheme from './styles/theme';
import CVPage from './components/CVPage';

function App() {
  return (
    <ChakraProvider theme={ extendedTheme }>
      <CVPage />
    </ChakraProvider>
  );
}

export default App;
