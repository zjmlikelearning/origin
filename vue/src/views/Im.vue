<template>
    <div v-if="!isMetaMaskInstalled">请先安装MetaMask插件。</div>
    <div v-else style="font-size: 20px">您已经安装了MetaMask插件，可以使用本网站!</div>
    <div class="container" style="margin-top: 100px">
        <div style="padding: 20px; color: #888">
        <el-row :gutter="20">
            <el-col :span="24">
                <el-radio-group v-model="selectedOption" class="radio-group">
                    <el-radio label="a">图书质量方面</el-radio>
                    <el-radio label="b">图书价格方面</el-radio>
                    <el-radio label="c">图书种类方面</el-radio>
                </el-radio-group>
            </el-col>
        </el-row>
        <el-row :gutter="20" style="margin-top: 30px;">
            <el-col :span="24" style="height: 20px;">
                <el-input type="textarea" :rows="3" v-model="messages1" readonly></el-input>
            </el-col>
        </el-row>
        <el-row :gutter="20" style="margin-top: 30px;">
            <el-col :span="24" class="button-container">
                <el-button type="primary" @click="getMessages">获取</el-button>
            </el-col>
        </el-row>
        <el-row :gutter="20" style="margin-top: 30px;">
            <el-col :span="20">
                <el-input v-model="inputText1"></el-input>
            </el-col>
        </el-row>
        <el-row :gutter="20" style="margin-top: 10px;">
            <el-col :span="24" class="button-container">
                <el-button type="primary" @click="sendMessage">发送</el-button>
            </el-col>
        </el-row>
        <el-row :gutter="20" style="margin-top: 40px;">
            <el-col :span="24">
                <el-input type="textarea" :rows="3" v-model="messages2" readonly></el-input>
            </el-col>
            <el-col :span="30">
                <el-input v-model="inputText2"></el-input>
            </el-col>

            <el-col :span="24" class="button-container">
                <el-button type="primary" @click="searchMessages">搜索</el-button>
            </el-col>
        </el-row>
    </div></div>
</template>

<script>
import ChatcontractABI from './ChatcontractABI.json';
import Web3 from 'web3';
const ChatcontractAddress = '0x87F2b2c52bb1646f0eAD2c8971703b1BcA82B5E7'
export default {
    data() {
        return {
            selectedOption: null,
            inputText1: '',
            inputText2: '',
            web3: null,
            Chatcontract: null,
            isMetaMaskInstalled: false,
            messages1: '',
            messages2: '',
        };
    },
    mounted() {
        this.isMetaMaskInstalled = typeof window.ethereum !== 'undefined';
        this.web3 = new Web3(Web3.givenProvider || 'https://sepolia.infura.io/v3/ec8601720f5d4df38fcc369093972e07');
        this.Chatcontract = new this.web3.eth.Contract(ChatcontractABI, ChatcontractAddress);
    },
    methods: {
            async sendMessage()
            {
                let userAddress;
                if (window.ethereum) {
                    const accounts = await window.ethereum.request({method: 'eth_requestAccounts'});
                    userAddress = accounts[0];
                }
                let projectName;
                if(this.selectedOption=="a"){ projectName="图书质量方面"}else if (this.selectedOption=="b"){ projectName="图书价格方面"}else if (this.selectedOption=="c"){ projectName="图书中路方面"};
                await this.Chatcontract.methods.sendMessage(projectName, this.inputText1).send({from: userAddress});
            },
        async searchMessages() {
            let projectName;
            if(this.selectedOption=="a"){ projectName="图书质量方面"}
            else if (this.selectedOption=="b"){ projectName="图书价格方面"}
            else if (this.selectedOption=="c"){ projectName="图书中路方面"};
              const messages = await this.Chatcontract.methods.searchMessages(projectName, this.inputText2).call();
              this.messages2= messages.map(message => {
                const timestamp = message.timestamp;
              const date = new Date(Number(timestamp*1000));
              const formattedDate = date.toLocaleString();
                  return message.projectName + ', ' + message.content + ', ' + formattedDate;
              }).join('\n');
              return this.messages2;
            },
        async getMessages() {
            let projectName;
            if(this.selectedOption=="a"){ projectName="图书质量方面"}
            else if (this.selectedOption=="b"){ projectName="图书价格方面"}
            else if (this.selectedOption=="c"){ projectName="图书中路方面"};
            const messages = await this.Chatcontract.methods.getMessages(projectName).call();
              this.messages1 = messages.map(message => {const timestamp = message.timestamp;
              const date = new Date(Number(timestamp*1000));
              const formattedDate = date.toLocaleString();
                  return message.projectName + ', ' + message.content + ', ' + formattedDate;
              }).join('\n');
              return this.messages1;
            },
    },
};
</script>

<style>
.container {
    padding: 20px;
}

.radio-group {
    display: flex;
    justify-content: center;
    font-size: 200px;
}

.button-container {
    display: flex;
    justify-content: center;
}
</style>

