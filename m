Received: from mail-qk1-f225.google.com (mail-qk1-f225.google.com [209.85.222.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0915E37757C
	for <brcm80211@lists.linux.dev>; Sun, 26 Jul 2026 19:25:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.225
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785093961; cv=none; b=FUHZrDDC4yQ6R+m8FT3rO21Ph+/VgJpo0rwDvnFs83o6OkGvd/g8QQCgXIMWWGfqXZ0887jagHHyAhjfgCX39ugQ6yN1SWcaSkG1UVji8uR4+Q3Yld9WvN48cSxDrY03rQ8Sv1mU2NkGeNAzvoq7cVRjtvbOPSlAKRGWHTLu3+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785093961; c=relaxed/simple;
	bh=on7glGeh4caiSB3pcGfRZR8zkqSL1zkInEmuH4mebus=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TZJIy1BxUVCuqez149QhzUoajn5+AvSAcU5vzdVYAoZaXSwUly51KXkE9AFKsaZAHwugDcmciHCqDvoPt/Zeezk+JX5kNQjc5GBrIew+QjaDVNFPqXzFkY8jlb8pn8Xcp129kbYVu/EW2HZOzEq9qjJMUUQth0rrOVn59XF9ZH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=BpCx7nqw; arc=none smtp.client-ip=209.85.222.225
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="BpCx7nqw"
Received: by mail-qk1-f225.google.com with SMTP id af79cd13be357-92e602d2c0fso263018285a.0
        for <brcm80211@lists.linux.dev>; Sun, 26 Jul 2026 12:25:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785093959; x=1785698759;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bJvM1kK3aqcT5eLv/p1Z+J8PnO1gr3+e9JD41JxAXhg=;
        b=lE5ImjQ0pjMdYGJrxTaaOET4vinTvf2ljAJVNmJDh/o+DdoXyOHsTRsrv1NOerkncr
         /WINQZ5bNfH7y3qJLCqWZAsvzyrXf0iye4UmuySuTCmvqL8Ru+TdxJlYzfn9sY2g3WBc
         HKjNAkH3hWHLrdXEgDOWkPwWVNQ32QHLtDLyySABBg375+tCmpqSCH7GiBVdCFDozpp0
         F6KkHfs5SHN68iyPUq0FI6bJOX9gP3q2JN9+3Ez1V02T8s2sYPpi3g4Ha5zm4gKUWOfL
         OpC2ZuykYePQW9GrugL/ejVUONafxsjv4yJ5PXMwmUQzpMOx7QP5UUgmTYaaV24IUDVR
         A1mw==
X-Forwarded-Encrypted: i=1; AHgh+RrRqLFHhGq2YZ45c8AFY4DP2QsZLHXQQfXpOroFCVrbXh83un0UxVTHPVhwqzGVbjFsprak7iz1WDo=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy6XoRX631avB9t+4qDQN3C6eNcjy/kNQjPHkjK/AxwKgoTdVwK
	r+t2Tdfj7UwLGTu/JJGqKTeIE7pwbzRV1B5XYGCiC5Wt6nKgJ/29cwppgYLbXaHeExB2BabUve6
	xYHqq1x2TbEyZeRYqym/0erVtI5BjFB2WR+wS+yGzRCtp8J5eo4h9+PWRtyty54W8I3iMLubA7t
	T9YNXRaDKX7NLrXEaT/7MN2DKKRMQS+E5vdugGsFJs151AXLLo8eA7g+iyhfyMGT3ZUDYlL1Ebr
	fgyy36wpPOgIyo+c5p5LA==
X-Gm-Gg: AR+sD12Laij03fiSbNIkK1fk9+gsWOMqfLdMS7U+JehVgBPU4rfBNeyi159QjyFmf+Q
	/EyIxR1qf1ySkpeKOb7Hu8mwHNX4px0QDlUx1/JlnQE14bWQoijkA36VCI3hjRevrZ4ZlwyT2Cp
	urdC5kTsVyq1ld43OrZAlWTWdWcgNpar16tHracwADSISM14D+RRHXHmHnJrOvbQoFnA9hpERQA
	0dvWXJzYjlIqSsxDPTSxn563/53fU7idOe5A0mQv++O3XhHrUjTAvIDF8w0+q0yhpv4I4qZK8/K
	k8gzr8mMrFOVlwHDmId309owqeve/qxD9cmFkhXWNX8h1VQDFQYEQ5m6PduT0zBJzX2YcmqdZ4k
	CGlG5S5SWSB0H2Epzk/ao0VK82kqaZaVtCDYDa41IMcMuD/5CF3zIcz0acPmIIAB4RcmIxydTKq
	AgImtXFabwZ+vRzE7WkwzP/85/P80f5pWoog4pWJM=
X-Received: by 2002:a05:620a:46a7:b0:8cd:d688:7aef with SMTP id af79cd13be357-932def355e5mr636518585a.19.1785093958792;
        Sun, 26 Jul 2026 12:25:58 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-25.dlp.protect.broadcom.com. [144.49.247.25])
        by smtp-relay.gmail.com with ESMTPS id af79cd13be357-932de5d934bsm24029585a.4.2026.07.26.12.25.57
        for <brcm80211@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 26 Jul 2026 12:25:58 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cce14a21faso27899735ad.0
        for <brcm80211@lists.linux.dev>; Sun, 26 Jul 2026 12:25:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1785093956; x=1785698756; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bJvM1kK3aqcT5eLv/p1Z+J8PnO1gr3+e9JD41JxAXhg=;
        b=BpCx7nqwfNYngrSOmfSr6LFcVtmk+v+gB1t5ipkk/qcd1Zj0pIqH0EnKjy2AetqZhU
         rub+FIqgGlz3R9aSmiszN5MOepcr16q6sXSzIlaRFKYUMY+BLZ1PN7zAgLgxo+H5moCE
         kEKQ1krFwnoF98+tCRbfRuX8iPSyXMgPp4NYs=
X-Forwarded-Encrypted: i=1; AHgh+RoYaULfqBgeXLjhH3JLdzASv5CT3qBPPmalrdy27e4o0fexHJ1umHRkV8s80+ZmhxbnePz46BRBLjk=@lists.linux.dev
X-Received: by 2002:a17:902:f789:b0:2c9:fc0d:165b with SMTP id d9443c01a7336-2cfd7196611mr78791345ad.23.1785093956364;
        Sun, 26 Jul 2026 12:25:56 -0700 (PDT)
X-Received: by 2002:a17:902:f789:b0:2c9:fc0d:165b with SMTP id d9443c01a7336-2cfd7196611mr78791225ad.23.1785093955903;
        Sun, 26 Jul 2026 12:25:55 -0700 (PDT)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc44cb92sm38355795eec.13.2026.07.26.12.25.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2026 12:25:55 -0700 (PDT)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	Arend van Spriel <arend.vanspriel@broadcom.com>
Subject: [PATCH -next 03/10] wifi: ath6kl: use pre-assigned cookie for remain_on_channel and mgmt_tx
Date: Sun, 26 Jul 2026 21:25:34 +0200
Message-ID: <20260726192541.2816743-4-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260726192541.2816743-1-arend.vanspriel@broadcom.com>
References: <20260726192541.2816743-1-arend.vanspriel@broadcom.com>
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

Stop generating cookies in ath6kl_remain_on_channel() and
ath6kl_mgmt_tx(). cfg80211 now pre-assigns the cookie before calling
into the driver.

For remain_on_channel, store the pre-assigned cookie in
vif->last_roc_id. Widen last_roc_id and last_cancel_roc_id from u32
to u64 to hold the full 64-bit cookie value.

For mgmt_tx, store the pre-assigned cookie in wmi->last_mgmt_tx_cookie
so the firmware TX status event handler can pass the correct cookie to
cfg80211_mgmt_tx_status(). Thread the cookie through the powersave
queue (ath6kl_mgmt_buff) so it is available when the frame is
eventually dequeued and sent.

Assisted-by: Claude:claude-sonnet-4-6
Signed-off-by: Arend van Spriel <arend.vanspriel@broadcom.com>
---
 drivers/net/wireless/ath/ath6kl/cfg80211.c | 18 ++++++------------
 drivers/net/wireless/ath/ath6kl/core.h     |  5 +++--
 drivers/net/wireless/ath/ath6kl/main.c     |  1 +
 drivers/net/wireless/ath/ath6kl/txrx.c     |  1 +
 drivers/net/wireless/ath/ath6kl/wmi.c      |  2 +-
 drivers/net/wireless/ath/ath6kl/wmi.h      |  1 +
 6 files changed, 13 insertions(+), 15 deletions(-)

diff --git a/drivers/net/wireless/ath/ath6kl/cfg80211.c b/drivers/net/wireless/ath/ath6kl/cfg80211.c
index ecde91159b54..e9d6e6a53d7d 100644
--- a/drivers/net/wireless/ath/ath6kl/cfg80211.c
+++ b/drivers/net/wireless/ath/ath6kl/cfg80211.c
@@ -3038,16 +3038,10 @@ static int ath6kl_remain_on_channel(struct wiphy *wiphy,
 {
 	struct ath6kl_vif *vif = ath6kl_vif_from_wdev(wdev);
 	struct ath6kl *ar = ath6kl_priv(vif->ndev);
-	u32 id;
 
 	/* TODO: if already pending or ongoing remain-on-channel,
 	 * return -EBUSY */
-	id = ++vif->last_roc_id;
-	if (id == 0) {
-		/* Do not use 0 as the cookie value */
-		id = ++vif->last_roc_id;
-	}
-	*cookie = id;
+	vif->last_roc_id = *cookie;
 
 	return ath6kl_wmi_remain_on_chnl_cmd(ar->wmi, vif->fw_vif_idx,
 					     chan->center_freq, duration);
@@ -3106,6 +3100,7 @@ static int ath6kl_send_go_probe_resp(struct ath6kl_vif *vif,
 
 static bool ath6kl_mgmt_powersave_ap(struct ath6kl_vif *vif,
 				     u32 id,
+				     u64 cookie,
 				     u32 freq,
 				     u32 wait,
 				     const u8 *buf,
@@ -3138,6 +3133,7 @@ static bool ath6kl_mgmt_powersave_ap(struct ath6kl_vif *vif,
 
 			INIT_LIST_HEAD(&mgmt_buf->list);
 			mgmt_buf->id = id;
+			mgmt_buf->cookie = cookie;
 			mgmt_buf->freq = freq;
 			mgmt_buf->wait = wait;
 			mgmt_buf->len = len;
@@ -3222,7 +3218,6 @@ static int ath6kl_mgmt_tx(struct wiphy *wiphy, struct wireless_dev *wdev,
 		 * Send Probe Response frame in GO mode using a separate WMI
 		 * command to allow the target to fill in the generic IEs.
 		 */
-		*cookie = 0; /* TX status not supported */
 		return ath6kl_send_go_probe_resp(vif, buf, len, freq);
 	}
 
@@ -3235,16 +3230,15 @@ static int ath6kl_mgmt_tx(struct wiphy *wiphy, struct wireless_dev *wdev,
 		id = vif->send_action_id++;
 	}
 
-	*cookie = id;
-
 	/* AP mode Power saving processing */
 	if (vif->nw_type == AP_NETWORK) {
-		queued = ath6kl_mgmt_powersave_ap(vif, id, freq, wait, buf, len,
-						  &more_data, no_cck);
+		queued = ath6kl_mgmt_powersave_ap(vif, id, *cookie, freq, wait,
+						  buf, len, &more_data, no_cck);
 		if (queued)
 			return 0;
 	}
 
+	ar->wmi->last_mgmt_tx_cookie = *cookie;
 	return ath6kl_wmi_send_mgmt_cmd(ar->wmi, vif->fw_vif_idx, id, freq,
 					wait, buf, len, no_cck);
 }
diff --git a/drivers/net/wireless/ath/ath6kl/core.h b/drivers/net/wireless/ath/ath6kl/core.h
index 77e052336eb5..a0b236eeeab5 100644
--- a/drivers/net/wireless/ath/ath6kl/core.h
+++ b/drivers/net/wireless/ath/ath6kl/core.h
@@ -404,6 +404,7 @@ struct ath6kl_mgmt_buff {
 	u32 freq;
 	u32 wait;
 	u32 id;
+	u64 cookie;
 	bool no_cck;
 	size_t len;
 	u8 buf[];
@@ -631,8 +632,8 @@ struct ath6kl_vif {
 	struct cfg80211_scan_request *scan_req;
 	enum sme_state sme_state;
 	int reconnect_flag;
-	u32 last_roc_id;
-	u32 last_cancel_roc_id;
+	u64 last_roc_id;
+	u64 last_cancel_roc_id;
 	u32 send_action_id;
 	bool probe_req_report;
 	u16 assoc_bss_beacon_int;
diff --git a/drivers/net/wireless/ath/ath6kl/main.c b/drivers/net/wireless/ath/ath6kl/main.c
index 8afc6589fc51..9c023d7ce305 100644
--- a/drivers/net/wireless/ath/ath6kl/main.c
+++ b/drivers/net/wireless/ath/ath6kl/main.c
@@ -898,6 +898,7 @@ void ath6kl_pspoll_event(struct ath6kl_vif *vif, u8 aid)
 		spin_unlock_bh(&conn->psq_lock);
 
 		conn->sta_flags |= STA_PS_POLLED;
+		ar->wmi->last_mgmt_tx_cookie = mgmt_buf->cookie;
 		ath6kl_wmi_send_mgmt_cmd(ar->wmi, vif->fw_vif_idx,
 					 mgmt_buf->id, mgmt_buf->freq,
 					 mgmt_buf->wait, mgmt_buf->buf,
diff --git a/drivers/net/wireless/ath/ath6kl/txrx.c b/drivers/net/wireless/ath/ath6kl/txrx.c
index 97fdac7237e2..b4d3c5cff881 100644
--- a/drivers/net/wireless/ath/ath6kl/txrx.c
+++ b/drivers/net/wireless/ath/ath6kl/txrx.c
@@ -1469,6 +1469,7 @@ void ath6kl_rx(struct htc_target *target, struct htc_packet *packet)
 					spin_unlock_bh(&conn->psq_lock);
 					idx = vif->fw_vif_idx;
 
+					ar->wmi->last_mgmt_tx_cookie = mgmt->cookie;
 					ath6kl_wmi_send_mgmt_cmd(ar->wmi,
 								 idx,
 								 mgmt->id,
diff --git a/drivers/net/wireless/ath/ath6kl/wmi.c b/drivers/net/wireless/ath/ath6kl/wmi.c
index c0c455d6e2dc..888bbbb5d17a 100644
--- a/drivers/net/wireless/ath/ath6kl/wmi.c
+++ b/drivers/net/wireless/ath/ath6kl/wmi.c
@@ -584,7 +584,7 @@ static int ath6kl_wmi_tx_status_event_rx(struct wmi *wmi, u8 *datap, int len,
 	ath6kl_dbg(ATH6KL_DBG_WMI, "tx_status: id=%x ack_status=%u\n",
 		   id, ev->ack_status);
 	if (wmi->last_mgmt_tx_frame) {
-		cfg80211_mgmt_tx_status(&vif->wdev, id,
+		cfg80211_mgmt_tx_status(&vif->wdev, wmi->last_mgmt_tx_cookie,
 					wmi->last_mgmt_tx_frame,
 					wmi->last_mgmt_tx_frame_len,
 					!!ev->ack_status, GFP_ATOMIC);
diff --git a/drivers/net/wireless/ath/ath6kl/wmi.h b/drivers/net/wireless/ath/ath6kl/wmi.h
index 8fbece3fdad9..89ce2abbb1cd 100644
--- a/drivers/net/wireless/ath/ath6kl/wmi.h
+++ b/drivers/net/wireless/ath/ath6kl/wmi.h
@@ -125,6 +125,7 @@ struct wmi {
 
 	u8 *last_mgmt_tx_frame;
 	size_t last_mgmt_tx_frame_len;
+	u64 last_mgmt_tx_cookie;
 	u8 saved_pwr_mode;
 };
 
-- 
2.54.0

