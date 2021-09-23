package com.example.plugin_hello

/**
 * @author lanxiaobin
 * @date 2021/9/19
 */
interface FlutterChannelDelegate {
    /**
     * @param actionCategory 行为类别: 0:其他行为  1:播放行为...
     * @param actionType 行为类型:play:播放; pause:暂停...
     * @param actionParams 当前行为对应的参数集
     */
    fun onAction(actionCategory: Int, actionType: String, actionParams: Map<String,Any>?) : Any?

}