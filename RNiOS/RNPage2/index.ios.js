/**
 * Sample React Native App
 */

import React, { Component } from 'react'
import CodePush from 'react-native-code-push'

import {
  AppRegistry,
  StyleSheet,
  Text,
  View
} from 'react-native'

class RNPS extends Component {
  componentDidMount () {
    CodePush.sync({
      updateDialog: {
        title: '更新提示',
        optionalIgnoreButtonLabel: '忽略',
        optionalInstallButtonLabel: '安装',
        optionalUpdateMessage: '有一个提示可用，是否安装？'
      },
      installMode: CodePush.InstallMode.ON_NEXT_RESUME
    })
  }
  render () {
    return (
      <View style={styles.container}>
        <Text style={styles.welcome}>
          Welcome to RN page 2
          Version is 1.0.6
        </Text>
      </View>
    )
  }
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    backgroundColor: '#F5FCFF'
  },
  welcome: {
    fontSize: 20,
    textAlign: 'center',
    margin: 10
  },
  instructions: {
    textAlign: 'center',
    color: '#333333',
    marginBottom: 5
  }
})

AppRegistry.registerComponent('RNPS', () => RNPS)
