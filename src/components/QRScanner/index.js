import React, { Component } from 'react'
import { StyleSheet, Text, Linking } from 'react-native'

import QRCodeScanner from  'react-native-qrcode-scanner'
import { RNCamera } from 'react-native-camera'


class QRScanner extends Component {
	onSuccess = e => {
		Linking.openURL(e.data).catch(err =>
			console.error('An error occured', err)
		);
	};

	render() {
		const { message, link} = this.props
		return (
			<QRCodeScanner
				onRead={this.onSuccess}
				flashMode={RNCamera.Constants.FlashMode.off}
				topContent={
					<Text style={styles.centerText}>
						{message}
						<Text style={styles.textBold}>{link}</Text> on
			 	    </Text>
				}
			/>
		);
	}
}

const styles = StyleSheet.create({
	centerText: {
		flex: 1,
		fontSize: 18,
		padding: 32,
		color: '#777'
	},
	textBold: {
		fontWeight: '500',
		color: '#000'
	},
	buttonText: {
		fontSize: 21,
		color: 'rgb(0,122,255)'
	},
	buttonTouchable: {
		padding: 16
	}
});

export default QRScanner

