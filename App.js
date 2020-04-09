/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 *
 * @format
 * @flow strict-local
 */

import React from 'react';
import {
  SafeAreaView,
  StyleSheet,
  ScrollView,
  View,
  Text,
  StatusBar,
  NativeModules,
  Button,
  Image,
  Dimensions,
} from 'react-native';

import LinearGradient from 'react-native-linear-gradient';

const App = () => {
  const Toast = NativeModules.Taost;
  console.log(Toast);
  return (
    <>
      <StatusBar
        barStyle="light-content"
        translucent={true}
        backgroundColor="transparent"
      />
      <LinearGradient
        start={{x: 0.25, y: 1.0}}
        end={{x: 1.0, y: 0.25}}
        colors={['#279C89', '#3EA573']}
        // colors={['#3EA573', '#000']}
        style={styles.linearGradient}>
        <Image source={require('./tower.png')} style={styles.tower} />
        <Button
          color="#fff"
          title="toast"
          onPress={() => Toast.show('السلام عليكم')}
        />
      </LinearGradient>
    </>
  );
};

const {width, height} = Dimensions.get('screen');

const towerScale = 158 / 667;

const styles = StyleSheet.create({
  logo: {
    width: 97,
    height: 148,
  },
  tower: {
    position: 'absolute',
    bottom: 0,
    left: 0,
    right: 0,
    height: height * towerScale,
    width,
  },
  linearGradient: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
  },
});

export default App;
