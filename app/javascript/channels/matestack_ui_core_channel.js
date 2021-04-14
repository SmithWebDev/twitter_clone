import consumer from "./consumer"
import MatestackUiCore from 'matestack-ui-core'

consumer.subscriptions.create("MatestackUiCoreChannel", {
  connected() {
  },

  disconnected() {
  },

  received(data) {
    MatestackUiCore.eventHub.$emit(data.event, data)
  }
});
