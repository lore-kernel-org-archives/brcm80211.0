Received: from mail-qv1-f100.google.com (mail-qv1-f100.google.com [209.85.219.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 862712E9730
	for <brcm80211@lists.linux.dev>; Tue, 28 Jul 2026 14:46:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785249967; cv=none; b=GxG8DJcDxBd27Xbij1Oj0RR+whglMz2eRcmCudb+zoRkF9kXVp45phMGq3+uaCrF/kQoZEKQceARi2KZL7r4FLer3ttvnpQZdHMwA+fYKLx7Tg6KuXy19zqIo6luKxFqq8HD3QpGc+0RrU5ZBuDSwJpyk3bfEqQq/+cnsKxP6MI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785249967; c=relaxed/simple;
	bh=on7glGeh4caiSB3pcGfRZR8zkqSL1zkInEmuH4mebus=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=k6vm3pp2xA7foxaLaDDeHwH/3P5oevqaZfxFofneU15v16EjOgHGDNLRDzblLXp0WuBaFHU86nAHi6fkYVhjuKE+zCIT0St8UCR9WT9dgPBlpZ1zBrIyjCZjihMIKW+bk4y/veNiu8/ejVC3w01IfWTRDHvGger6TP23gRfP7Jw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=gtG5KZtg; arc=none smtp.client-ip=209.85.219.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="gtG5KZtg"
Received: by mail-qv1-f100.google.com with SMTP id 6a1803df08f44-8edda5d56a5so42689976d6.3
        for <brcm80211@lists.linux.dev>; Tue, 28 Jul 2026 07:46:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785249964; x=1785854764;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bJvM1kK3aqcT5eLv/p1Z+J8PnO1gr3+e9JD41JxAXhg=;
        b=iHv7xyX5lF3adXHJEhoek+IbdT3JWyQ68ckrCIQinCdUX3OqFS7ANMoHWCs9Zh4sUn
         LGI5c65d8g5BcBMk/jC8Ji9tI4EDeGOtDRtPliIqJ1NhLq8WslR9eXgr4FOEOyopYmab
         5ERM0XE6dAFQf/q4zG5MDfYCIKoHIU2f7LSGXNL4fwO9H2ICQS1STdruY0Jb3cqHxiVi
         VjXEOcdEjndlDxqu1av2qOyNg0htvYc9qyKyDzyn81LSY1XxRIpWHCG0vP2xshJITGsu
         ouMx8E8xa42f+5bCAPys0clrXtNADhY3cLn6+E6Zmygya6QcLSNfLPwa4XbC9XHg/q7j
         /j0g==
X-Forwarded-Encrypted: i=1; AHgh+RoSrgL5v460YGsEBg2OIKibi1/2ZC8w1UnyVI36gH+yA+C97SYzgVNLwTJzrFM6GGUwtTGlfux7EAQ=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz8DwILZClctU4HXYxdBOQS24SN/zUBk2R1614na53zGrHLkVjX
	TWGKMs7NIMBZP+kLVJlPqDfkDm0qzXqD5T0oI3CbSg1ith2CahRLCcVKRG8oSS5ArWZJDBM3iBm
	lcAs7LQ3Z9jCWy4R72swYsOYS74moYGW9CoC8G89UipHl1KxZAOV6DYORLpIHx/f+z0qsglFdUE
	8WzWLX+HPoRFIJb/KYsq3SwYst8QLP1gB8ypYSoqXIBjcRoiSjCzUS0zHVH35kvwcERDktVIuOL
	3T5oGnFvNuM9yk+Cwj4AQ==
X-Gm-Gg: AR+sD10c99kFcR7fsv8WGYTA1RFSfg7Q7Rk5ZyBQaNmXs9qj1rxJV4SOhHp8q5N8sro
	qF4RmO374ljUOsR4HIwU58GlwhXQ6EJkTIqwm1zPTopwVyBUGkAfeIzAJzIS9n2XWB/UQtbGTaq
	uAVIXRAxxqrLN4IbI4qlp4qLzXEJT+hH/xrXUYjDqWLCg0XSNBFQJjCDezLX3a0yT3gaG0fXpGa
	ZgUS4OBoMOyBe6pxUDH4Q5VxfsCozyL1iLGEAxK1hJgjFfbP8Rd1QPjyCAMPmmF6yAsZgc3hYAm
	+3l32FR7MtS4CerWTGg9oL4Fd4Ftppc9ZRD4yxERRkfTjthQsOvaO+lAWaBMb91UVMXAjc2RMdg
	MUNT1pjJ+Uj45zYeJyeSVH7BPuw/xxl7OfdIYYBqAHVuUB7Tf7v0F/4kOMhAWu8WjGowkhIPQNx
	nBIcCYM20Ou3o6S94xqkw/1c6jlcJC4aTCYPBhnH0=
X-Received: by 2002:ad4:5ccb:0:b0:8ef:24e9:4258 with SMTP id 6a1803df08f44-908172f74f0mr29671946d6.39.1785249964016;
        Tue, 28 Jul 2026 07:46:04 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-26.dlp.protect.broadcom.com. [144.49.247.26])
        by smtp-relay.gmail.com with ESMTPS id 6a1803df08f44-9081dd1530fsm35676d6.23.2026.07.28.07.46.03
        for <brcm80211@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 28 Jul 2026 07:46:04 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-933023a5980so124088685a.3
        for <brcm80211@lists.linux.dev>; Tue, 28 Jul 2026 07:46:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1785249963; x=1785854763; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bJvM1kK3aqcT5eLv/p1Z+J8PnO1gr3+e9JD41JxAXhg=;
        b=gtG5KZtgHeOGAUTEwj1rrlElsYGSRihSzqKIHdZgDjuXbUmZ1F9HsYA8mxhV8yhOWU
         8T2nPvwXdanM3nCbwpIHNmd3gTJEDgG4uSYHgqRihQblPkrm0XeJ2sd1Fonws1RuoGV5
         uisVmo/KEhGoNjECl9aJDYMnCOWBMcXFpNDkc=
X-Forwarded-Encrypted: i=1; AHgh+RrzCLdTICKTJz51KgXCrL2T53QnwOjUFDWg8r428f19C20D0VK4JIqQ3PTi3CjyxZbTp0MxNRbcEmM=@lists.linux.dev
X-Received: by 2002:a05:620a:710c:b0:92e:f0a5:ac33 with SMTP id af79cd13be357-933026298dbmr254105585a.1.1785249962618;
        Tue, 28 Jul 2026 07:46:02 -0700 (PDT)
X-Received: by 2002:a05:620a:710c:b0:92e:f0a5:ac33 with SMTP id af79cd13be357-933026298dbmr254098985a.1.1785249961862;
        Tue, 28 Jul 2026 07:46:01 -0700 (PDT)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-932de519154sm878659685a.5.2026.07.28.07.45.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 07:46:00 -0700 (PDT)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	Arend van Spriel <arend.vanspriel@broadcom.com>
Subject: [PATCH -next v2 03/12] wifi: ath6kl: use pre-assigned cookie for remain_on_channel and mgmt_tx
Date: Tue, 28 Jul 2026 16:45:40 +0200
Message-ID: <20260728144549.2207061-4-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260728144549.2207061-1-arend.vanspriel@broadcom.com>
References: <20260728144549.2207061-1-arend.vanspriel@broadcom.com>
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

