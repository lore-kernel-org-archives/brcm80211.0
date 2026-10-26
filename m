Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792993051;
	b=VmZJLFD5wysC6gkbhC0t4Afenz43RnIAEVnu5eJYcrWj8Bf/oCnBZoMJN6vKBA8C8dPE
	 xz99QkU+smrAmi803qUVEt8+7FkcBGCTx2jk0IeYQmVjwj7gGNy5GMTzHaB1m9vsJtwq4
	 L5lBB4v+IjLJN+VE5pOgg+LrjI2H+MECD04p0tHy2IFB9z6UfjkXoVB7ES52gG8qYX0TV
	 R2wUpVZnYmfVKv0MxRU+QiZqMDYJK2IAabjiGA7JBkGzpEgl0p8ICn7GptKxRkVaQQ1Vi
	 SHIXRM3Uygvh9YffxN2lrDbNXlLG0a/LHJIQtkmT7OtnDJC6NWJFWvHPMEkYnnP/Stg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792993051;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=zzY09t8y+jy+Ilnq+453JPfhX/+Ylhy72YIlTe29roA=;
	b=GQSfFVMu08fArHxzjwfiCMJslfjQws+xpOR8c2WWum8Ua8hxTX6chlbCjhd2aaCNN4h4
	 wkEgMaz4Y8lCYvMGb4B79wVlVjgDtVGi/Mwe2ffDFwn9Eh796tvzo/SMJbyShcbNuMlt8
	 IbU5e+IeFNkBGvZvRkqAn+TS0jieOmJGv8SDQumFEDZElC8Ur9WdyQJZ+t/kxhw9rXhHb
	 1JP5Y9zJnR2klEQqGo5t049sGJv8RQT8T2YWVP+UYqDifdKKoXz9SdoWDqvODwBq1GJYc
	 /LQUTd/F4+lruTXwXMHi2UcnYyLRU6efYoZB8GoGeuVrBg7TYsucSZ0dIgONavLXMyQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=aynjNnQk;
	arc=none smtp.remote-ip=209.85.210.176
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 999F660A3803
	for <brcm80211@lists.linux.dev>; Mon, 26 Oct 2026 05:37:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 999F660A3803
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=aynjNnQk
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-8a058f74a54so783849b3a.1
        for <brcm80211@lists.linux.dev>; Sun, 25 Oct 2026 22:37:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792993050; x=1793597850; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zzY09t8y+jy+Ilnq+453JPfhX/+Ylhy72YIlTe29roA=;
        b=aynjNnQkR2+zWnINlqNcQjPxEisbYL1QhxCCoGwyv8qpcNdxhXFHMMO2v4zSK+tyNH
         jiVz3V6tF9G5DFNXcGeZObhGxvVQeSLKHfz9Un4mKtNLTz7BeIeP8JjmPU+et0/DBhqB
         Ijsi8xYonFSLNuME0lyyeP6nnNREQItThHp1D6WAVVYsFvcAlfXEFs7EIIYj0OGtIkmI
         stqycsc956kJvgFELZFcJL0PeNSAHzK+Ev5gzzyknph2JPDH+mG7EuIX8MuoANHFFgX5
         5pLUFHr/5ncU9tu/Yw7sHsqwBuB81P2NPNuEW+wQXWMTGHb5c5dLXWl+Rt0jMCtO3cH2
         avog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792993050; x=1793597850;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zzY09t8y+jy+Ilnq+453JPfhX/+Ylhy72YIlTe29roA=;
        b=uBgcXVYyCRGcXCfE7rxEWWpJHBtGYcSN8meKhwLaEDoZqsltjHmTZIpgplRBfncj9E
         l2ju4gjrkQAV/YAi73zDEvergkiF5fK3VWCsa2peDfjLfKp+SV1fluF+YA4EKKfZL9iZ
         uM4C8VF9pQaj8/hsTyKfF2XPXT5bveJt+ixOfqLS40LNhNkw5vyV41XoyUKvLA8E0so4
         fJOyBOYteQKuaQExe76Xhw+2PV7TCFX6hmUl16ilxdWyr3NyFKnjeIgqeost0DKr6AEz
         bAhOAZvgedJPXQTCvE8rnepUdJ1hqvFbc6CwPADydaexiay3Fs8sxdfJPiOsd27Z0hIn
         WUQg==
X-Forwarded-Encrypted: i=1; AKwUvBwdtkqwoxmZ+p6yAjmnXLUBNvFmKw+esCtKlDmV1O8GR5m8e+CFDBvGKX4TlYmC8v1ywvEYuZFlnho=@lists.linux.dev
X-Gm-Message-State: AFq9FYKpTAdPNqM5iZaqmOlDs3WjZ0fj6+9P2V1ZVCuEOKFbCoSuf1g1
	ZgmiqY8yvmPlqLMo3WhFaejp0oEcXX2AENwOqfsgvGyhxqS6848Ne+zC
X-Gm-Gg: AYBFou1cXCJkFYl4wt1TMw2qniv/n5FV/vKWy0pO3pxlz6q++RmLy+43x9ayXGkNTmA
	ifQTJS5GII27Rqxc2+HetHGk6PbAKCBenrNnewoO1RUOD3VJrwljThtYhR8KuP/Pd6TuxOYW70x
	pA5mNDuePuib/PrDf4ucul0npGrMR9gG9BpeVA9dJSs2VxdtGWFq9dshjQmeRBBqFeoyZtCm4GE
	JGzk5S/UZcUDqXlkyqlWZfykuioB5Rh1qozxDe7dOnUevN9vFHNh9ve4DBgao+gYhjsSHuUqu4o
	PjLX8pNUywLocN+Toa+wIouNiN443TWmrGYzSkSm1yIP4Gl36DcRwZjx8X6/LYRxBYngtgHH2dd
	UoYgknpWTqBXuFJgLfblOA71N5GniBifumQcp2ydYdUL+k5sIqXzsJq0lJGYvIgDzoy3UuBXJqm
	WvHpinD+Frp4YlVcl5k2a53AevWgJKI2Erzzft5Nkf36EcQ0CPkOlZupIgXwro4W7fZIj69SxKm
	zOmjJJ8z8cNxCZytmNL+0PvqdmmWfGzLCm02MP7a2A2vX4S7ErPjL229f8SCaVIOwBcp1VIgp6Q
	iX8s
X-Received: by 2002:a05:6a00:3901:b0:89f:7a1b:2bf4 with SMTP id d2e1a72fcca58-8a3661c5268mr4676396b3a.16.1792993050026;
        Sun, 25 Oct 2026 22:37:30 -0700 (PDT)
Received: from acemagic-m1.tail4fb79.ts.net ([2401:7400:c804:b668:673b:a930:e065:eca])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a368d867a0sm927851b3a.2.2026.10.25.22.37.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 22:37:29 -0700 (PDT)
From: Ragul Balaji <ragulbaby@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: Arend van Spriel <arend.vanspriel@broadcom.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	brcm80211@lists.linux.dev,
	Ragul Balaji <ragulbaby@gmail.com>,
	Ho Jie Feng <hjf3108@gmail.com>,
	linux-kernel@vger.kernel.org,
	brcm80211-dev-list.pdl@broadcom.com
Subject: [RFC PATCH wireless-next 11/17] wifi: bcm4323x: add the shared definitions
Date: Mon, 26 Oct 2026 13:36:17 +0800
Message-ID: <20261026053633.361454-12-ragulbaby@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261026053633.361454-1-ragulbaby@gmail.com>
References: <20261026053633.361454-1-ragulbaby@gmail.com>
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Post: <mailto:brcm80211@lists.linux.dev>
List-Help: <mailto:brcm80211+help@lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
List-Owner: <mailto:brcm80211+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the definitions for the BCM4323x devices.

Signed-off-by: Ragul Balaji <ragulbaby@gmail.com>
Signed-off-by: Ho Jie Feng <hjf3108@gmail.com>
---
 .../broadcom/brcm80211/bcm4323x/bcm4323x.h    | 258 ++++++++++++++++++
 1 file changed, 258 insertions(+)
 create mode 100644 drivers/net/wireless/broadcom/brcm80211/bcm4323x/bcm4323x.h

diff --git a/drivers/net/wireless/broadcom/brcm80211/bcm4323x/bcm4323x.h b/drivers/net/wireless/broadcom/brcm80211/bcm4323x/bcm4323x.h
new file mode 100644
index 000000000..cd1c83dd4
--- /dev/null
+++ b/drivers/net/wireless/broadcom/brcm80211/bcm4323x/bcm4323x.h
@@ -0,0 +1,258 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#ifndef BCM4323X_H
+#define BCM4323X_H
+
+#include <linux/atomic.h>
+#include <linux/bitfield.h>
+#include <linux/completion.h>
+#include <linux/etherdevice.h>
+#include <linux/ieee80211.h>
+#include <linux/input.h>
+#include <linux/kfifo.h>
+#include <linux/led-class-multicolor.h>
+#include <linux/leds.h>
+#include <linux/mutex.h>
+#include <linux/skbuff.h>
+#include <linux/types.h>
+#include <linux/usb.h>
+#include <linux/wait.h>
+#include <linux/workqueue.h>
+#include <net/mac80211.h>
+
+#include <brcmu_rate.h>
+#include <brcmu_utils.h>
+#include <brcmu_wifi.h>
+#include <d11.h>
+
+#define BCM4323X_RX_SIZE 16384
+#define BCM4323X_RX_URBS 8
+#define BCM4323X_RPC_CLASS_MASK GENMASK(31, 24)
+#define BCM4323X_RPC_SESSION_MASK GENMASK(23, 16)
+#define BCM4323X_RPC_XID_MASK GENMASK(15, 0)
+#define BCM4323X_RPC_CLASS_DATA 1
+#define BCM4323X_RPC_CLASS_CONTROL 2
+#define BCM4323X_RPC_CLASS_TRANSPORT 3
+#define BCM4323X_RPC_SESSION 0x69
+#define BCM4323X_RPC_PROC_VERSION 1
+#define BCM4323X_RPC_PROC_CHIP 2
+#define BCM4323X_RPC_PROC_CHIP_ACK 3
+#define BCM4323X_RPC_VERSION 0x0564442e
+/* brcmsmac's bcma_read16() or bcma_read32() of a d11 register: {offset, size} */
+#define BCM4323X_RPC_PROC_REG_READ 0x01
+#define BCM4323X_RPC_PROC_LED_BLINK 0x76
+#define BCM4323X_RPC_PROC_GPIO_OUT 0x77
+/* brcmsmac's brcms_c_watchdog(), which the firmware answers while it runs */
+#define BCM4323X_RPC_PROC_WATCHDOG 0x99
+#define BCM4323X_NUM_2GHZ_CHANNELS 14
+#define BCM4323X_NUM_5GHZ_CHANNELS 24
+#define BCM4323X_NUM_CHANNELS (BCM4323X_NUM_2GHZ_CHANNELS + BCM4323X_NUM_5GHZ_CHANNELS)
+#define BCM4323X_ANTENNAS (BIT(0) | BIT(1))
+
+#define BCM4323X_HW_PAIRWISE_BASE 4
+#define BCM4323X_HW_KEYS M_SECKINDXALGO_BLK_SZ
+
+#define BCM4323X_NUM_CCK_RATES 4
+#define BCM4323X_NUM_OFDM_RATES 8
+#define BCM4323X_NUM_RATES (BCM4323X_NUM_CCK_RATES + BCM4323X_NUM_OFDM_RATES)
+#define BCM4323X_NUM_MCS 16
+#define BCM4323X_TX_STATUSES 8
+/* The index of the staged batch in tx_batches[], after the committed ones */
+#define BCM4323X_TX_STAGED 2
+
+struct bcm4323x_rpc_header {
+	__le32 length;
+	__le32 xid_class;
+	__le32 procedure;
+} __packed;
+
+/* The length word counts the bytes that follow it. */
+static inline __le32 bcm4323x_rpc_length(size_t body_length)
+{
+	return cpu_to_le32(sizeof(struct bcm4323x_rpc_header) - sizeof(__le32) + body_length);
+}
+
+static inline __le32 bcm4323x_rpc_xid_class(u8 rpc_class, u16 xid)
+{
+	return cpu_to_le32(FIELD_PREP(BCM4323X_RPC_CLASS_MASK, rpc_class) |
+			   FIELD_PREP(BCM4323X_RPC_SESSION_MASK, BCM4323X_RPC_SESSION) |
+			   FIELD_PREP(BCM4323X_RPC_XID_MASK, xid));
+}
+
+/* Procedure 0x52 */
+struct bcm4323x_tx_status {
+	/* from brcmsmac: struct tx_status, in little endian and in another order */
+	__le16 reserved0;
+	__le16 frameid;
+	__le16 status;
+	__le16 sequence;
+	__le32 lasttxtime;
+	__le16 phyerr;
+	__le16 ackphyrxsh;
+	__le32 reserved1[2];
+	/* The second status package of an aggregate, as in brcmsmac */
+	__le32 s1;
+	__le32 s2;
+} __packed;
+
+struct bcm4323x_txq {
+	struct sk_buff_head frames;
+	u8 ampdu_window;
+};
+
+/* Board/chip specific data*/
+struct bcm4323x_chip {
+	bool has_5ghz;
+	u8 channel_data_2ghz[3];
+	/* Hardcoded to green on GPIO 2 and red on GPIO 3 for now*/
+	bool has_wps_led;
+	/* Hardcoded to GPIO 10 for now */
+	bool has_wps_button;
+};
+
+struct bcm4323x {
+	struct ieee80211_hw *hw;
+	struct ieee80211_supported_band bands[2];
+	struct ieee80211_channel channels[BCM4323X_NUM_CHANNELS];
+	const struct bcm4323x_chip *chip;
+	struct usb_device *udev;
+	struct usb_interface *intf;
+	bool running;
+	/* Set when firmware hangs, different from running */
+	unsigned int dead;
+
+	/* Serializes the I/O buffer, transaction IDs and control responses. */
+	struct mutex io_mutex;
+
+	/* Shared USB transfer buffer */
+	u8 *io_buffer;
+	/* USB packet serial number */
+	u16 rpc_xid;
+	struct completion handshake_done;
+	__le32 handshake_chip;
+
+	struct delayed_work watchdog_work;
+	unsigned int watchdog_failures;
+	unsigned long phy_cal_expires;
+
+	struct urb *rx_urbs[BCM4323X_RX_URBS];
+	/* Only the first sub-frame in an A-MPDU have PLCP, save it for later frames */
+	u8 rx_ht_plcp[4];
+
+	u16 chanspec;
+	bool band_switched;
+	u16 ss_algo_channel;
+	int tx_power;
+	bool scanning;
+	s8 noise[BCM4323X_NUM_CHANNELS];
+	u32 filter_flags;
+
+	unsigned int tx_pipe;
+	struct usb_anchor tx_anchor;
+	wait_queue_head_t tx_wait;
+	struct sk_buff_head tx_queue;
+	struct work_struct tx_work;
+	DECLARE_KFIFO(tx_statuses, struct bcm4323x_tx_status, BCM4323X_TX_STATUSES);
+
+	/* Serializes the TX work with pausing, and protects the fields below. */
+	struct mutex tx_mutex;
+	u16 tx_sequence;
+
+	struct sk_buff_head tx_batches[BCM4323X_TX_STAGED + 1];
+	struct urb *tx_commit;
+	unsigned int tx_owned;
+	unsigned long tx_expires;
+	bool tx_paused;
+
+	struct ieee80211_vif __rcu *active_vif;
+
+	DECLARE_BITMAP(keys, BCM4323X_HW_KEYS);
+	u8 key_peers[BCM4323X_HW_KEYS][ETH_ALEN];
+
+	struct led_classdev led;
+	char led_name[32];
+	struct led_classdev_mc wps_led;
+	struct mc_subled wps_subleds[2];
+	char wps_led_name[40];
+	struct input_dev *wps_button;
+	char wps_button_phys[32];
+};
+
+/* Whether mac80211 started the device and the firmware still works */
+static inline bool bcm4323x_active(struct bcm4323x *dev)
+{
+	return READ_ONCE(dev->running) && !READ_ONCE(dev->dead);
+}
+
+int bcm4323x_rpc_send(struct bcm4323x *dev, u32 procedure, const void *body, size_t body_length);
+int bcm4323x_rpc_call(struct bcm4323x *dev, u32 procedure, const void *body, size_t body_length,
+		      void *response, size_t response_length);
+
+/* Sends a data procedure whose body is the arguments, as little-endian words */
+#define bcm4323x_rpc_send_u32(dev, procedure, ...) ({				\
+	u32 __body[] = { __VA_ARGS__ };						\
+										\
+	cpu_to_le32_array(__body, ARRAY_SIZE(__body));				\
+	bcm4323x_rpc_send(dev, procedure, __body, sizeof(__body));		\
+})
+
+/* Calls a control procedure the same way, with a word of response if any */
+#define bcm4323x_rpc_call_u32(dev, procedure, response, ...) ({			\
+	u32 __body[] = { __VA_ARGS__ };						\
+										\
+	cpu_to_le32_array(__body, ARRAY_SIZE(__body));				\
+	bcm4323x_rpc_call(dev, procedure, __body, sizeof(__body), response,	\
+			  sizeof(__le32));					\
+})
+
+void bcm4323x_fatal_error(struct bcm4323x *dev);
+int bcm4323x_start_rx_urbs(struct bcm4323x *dev);
+void bcm4323x_kill_rx_urbs(struct bcm4323x *dev);
+
+#ifdef CONFIG_MAC80211_LEDS
+void bcm4323x_led_init(struct bcm4323x *dev);
+void bcm4323x_led_register(struct bcm4323x *dev);
+void bcm4323x_led_unregister(struct bcm4323x *dev);
+#else
+static inline void bcm4323x_led_init(struct bcm4323x *dev) {}
+static inline void bcm4323x_led_register(struct bcm4323x *dev) {}
+static inline void bcm4323x_led_unregister(struct bcm4323x *dev) {}
+#endif
+
+extern struct ieee80211_rate bcm4323x_rates[BCM4323X_NUM_RATES];
+
+static inline unsigned int bcm4323x_first_rate(enum nl80211_band band)
+{
+	return band == NL80211_BAND_5GHZ ? BCM4323X_NUM_CCK_RATES : 0;
+}
+
+extern const struct ieee80211_ops bcm4323x_ops;
+int bcm4323x_register_hw(struct bcm4323x *dev);
+int bcm4323x_write_shm(struct bcm4323x *dev, u32 offset, u16 value);
+int bcm4323x_read_shm(struct bcm4323x *dev, u32 offset, u16 *value);
+int bcm4323x_init_mac(struct bcm4323x *dev);
+
+void bcm4323x_rx_complete(struct urb *urb);
+
+void bcm4323x_init_tx(struct bcm4323x *dev);
+void bcm4323x_init_basic_rate(u8 *basic_rate, enum nl80211_band band, u32 basic_rates);
+u8 bcm4323x_stf_mode(u16 ss_algo_channel);
+u8 bcm4323x_ac_to_fifo(u8 ac);
+void bcm4323x_tx_status(struct bcm4323x *dev, const u8 *body, size_t body_length);
+void bcm4323x_check_tx(struct bcm4323x *dev);
+void bcm4323x_set_tx_paused(struct bcm4323x *dev, bool paused);
+bool bcm4323x_quiesce_tx(struct bcm4323x *dev);
+void bcm4323x_flush_tx(struct bcm4323x *dev);
+void bcm4323x_retire_key(struct bcm4323x *dev, u8 key_index, struct ieee80211_sta *sta);
+void bcm4323x_init_txq(struct ieee80211_txq *txq);
+void bcm4323x_tx(struct ieee80211_hw *hw, struct ieee80211_tx_control *control,
+		 struct sk_buff *skb);
+void bcm4323x_wake_tx_queue(struct ieee80211_hw *hw, struct ieee80211_txq *txq);
+int bcm4323x_sta_state(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
+		       struct ieee80211_sta *sta, enum ieee80211_sta_state old_state,
+		       enum ieee80211_sta_state new_state);
+void bcm4323x_flush(struct ieee80211_hw *hw, struct ieee80211_vif *vif, u32 queues, bool drop);
+int bcm4323x_ampdu_action(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
+			  struct ieee80211_ampdu_params *params);
+
+#endif /* BCM4323X_H */
-- 
2.53.0

