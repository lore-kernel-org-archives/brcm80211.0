Received: from mail-pj1-f100.google.com (mail-pj1-f100.google.com [209.85.216.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D627D41D10A
	for <brcm80211@lists.linux.dev>; Fri, 31 Jul 2026 12:35:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785501328; cv=none; b=DmtObSCjtHIYDZRrzuRYDlL4I3cLa4HJajQTpPlf7mn2AU7D9o+DIutkh5WYqFo+ELOzevX5CVl3YbTw3bqa2Hy+WDq1WayNmFYjpNQYOzjiqXOfV/jXGWezh8e/cbcwjjipYfW0o3DwesF5FkbxECGwuGCF/LJ3wC+aQHCBfVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785501328; c=relaxed/simple;
	bh=jK3suJFo5svwCW7SI53ge/3Tbq431K/wpYj8IJr6xLM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cqFaNbkNn0AOqd70nESZGbDtZ5AFxpvUAnqLofK8rq/vmq5ju+xz97OFe4iyVU0H77J8rVuZfTBWvanLByjaioIM3TjN2+TEp/nLF2Op0Lg+ZY8c4uTJ2CKs2PYsu8M/+JRh3N7B1rr1dh/+MNmx8DUJ8XKp9gJ4l9m3uZCbprQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=G0/8jZ9K; arc=none smtp.client-ip=209.85.216.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="G0/8jZ9K"
Received: by mail-pj1-f100.google.com with SMTP id 98e67ed59e1d1-38e69bdb0fcso679798a91.1
        for <brcm80211@lists.linux.dev>; Fri, 31 Jul 2026 05:35:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785501326; x=1786106126;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kIl1FECj4ULR/8VITs0v8eyw9e7Au1gZH8UIwlr6tTU=;
        b=aNM7czbXwJ3VkjM58hFXy+WZ3VqgbBXHcMxjtpqI7sMXaxHTgStzMAolD8eauIayEP
         Kv5s+Z0txvoP5HTgves+nz2LR8iZewghPc8hVqa9tDr7Tlmg1GadX+2nqKZ/8vBaelVz
         w+jbFhkDN/nM6u0MVJK1VrNxRndABHhxpvjO/0e6VQww+I/KKOsvU1AmKafLe1bcAF7K
         q0eetRV5VbyojA2TJ3sYC7a2+2dJcv/diGT990iqmbj3p3mkH40FYw6Ir6TfHOP5mQ5I
         jmNACwFb9ljU2WFXWl4jKvKhK4wl9JtAErAezVSXxVFCssmlxqixJUlV9Ew2u6g12psc
         twqw==
X-Forwarded-Encrypted: i=1; AHgh+RrNbL0XjTHpmpiXJs3nM3dzVQWURpbRSvc1HVL2SFDs97F3Ss6jbj/Llj64Rxn0Zd7GeyOfSK2DCDk=@lists.linux.dev
X-Gm-Message-State: AOJu0Yyxpsj+YVFBIKrq0zWB9gQD8Q4yQIoX1tbqImkxVSaC/kvVPvAy
	7SRomJgwUKmF/SL10p3hL/aUueFgVV9RHuOvDI7p3Di7DUQcw1YdMq2U6Puec+wBzp+qbxLor6I
	0PwPAvXA1K5GKiGn/F7JqVYzDvkoGqVGcum21rR83HyLdHx/xWALUKEt4MyNYbDkOuasCk1fgRg
	BD3TL9GVVEJAZ0XDKYlsLtJ6XdrlB9g9A0UUakqftLLY/dXUWPejLV4rqlmv5v4o9WjQSqttC/H
	DSMwVXM0f6eeSnBh74o4g==
X-Gm-Gg: AR+sD13543qHdyApiZGWbvTd+yMs21uj9vDybiAQEWwn4fPuEHrcaqrY3Z7pJ2H+9pc
	0PFExYTj8xNfdojbbCWC5QmNAtLaitmmOHniMdbFTBAL8NNkCbncpUguHdkXr4/G8uubovyD0iE
	WN+EZzT0ZyM3AMS5j/aiu92M67A5gV1TzZP/NJVb03s+sqUt3ihkEcFwTBh0rbFGVSBjoM+w+Ae
	rUOHiq5mAjy6qmyhsu8tW4moGZtQ2mReqIyZbhPq0N3eXvELCubc9U97kUTl0ulfdxPWfO4UVhA
	P4tEIU8jOj1hz3YABOGhxUiUfqOZhX0t0kne8tL5UmF+GOuEtre/yjccW06R0ckkUvA0QSiWMWn
	adL/oXSO3IRutGeDfqbzKZB+PIvaKZstfFg33u0lLC4NUlfcB2YYj4FitAapHDQmpTGxRZbtLlY
	xZMRKrdRH1bnrEQ6PVGruMMmerBt4KE4RQdraCG9w=
X-Received: by 2002:a05:6a21:998a:b0:3c6:566d:edf2 with SMTP id adf61e73a8af0-3c91b360d8amr1999538637.51.1785501325980;
        Fri, 31 Jul 2026 05:35:25 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-27.dlp.protect.broadcom.com. [144.49.247.27])
        by smtp-relay.gmail.com with ESMTPS id 41be03b00d2f7-cbe39667495sm94982a12.4.2026.07.31.05.35.25
        for <brcm80211@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 31 Jul 2026 05:35:25 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cb5cc1e139bso602158a12.3
        for <brcm80211@lists.linux.dev>; Fri, 31 Jul 2026 05:35:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1785501324; x=1786106124; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kIl1FECj4ULR/8VITs0v8eyw9e7Au1gZH8UIwlr6tTU=;
        b=G0/8jZ9KWOMVrW5bJcPkgBuoc6VmTytoxFUQG5kUa6akzW/DHNhpN9ZrgKbrhNJMdf
         D30NmU2bOaXVvQQ/mx9jRZdXCkQzeNachHyKDx5fObCkniSFvccrFG9R0keM+aqRcF0d
         Nb3+JGYsGoJQcsQeUxsdqAjBX4LjWNJ9vTCE0=
X-Forwarded-Encrypted: i=1; AHgh+Rq1HmD8pMan/Udcw/nGcxsC5rSX6JQWWozfNxmel/E/AD5fvPZi/2pWQhIplTFqcFb+optxypyseQE=@lists.linux.dev
X-Received: by 2002:a05:6a21:3216:b0:3c3:c687:a3b9 with SMTP id adf61e73a8af0-3c91b314ab8mr1859158637.48.1785501323993;
        Fri, 31 Jul 2026 05:35:23 -0700 (PDT)
X-Received: by 2002:a05:6a21:3216:b0:3c3:c687:a3b9 with SMTP id adf61e73a8af0-3c91b314ab8mr1859141637.48.1785501323572;
        Fri, 31 Jul 2026 05:35:23 -0700 (PDT)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153dd9be04sm5187041eec.9.2026.07.31.05.35.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 05:35:23 -0700 (PDT)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	Arend van Spriel <arend.vanspriel@broadcom.com>
Subject: [PATCH -next v3 03/13] wifi: ath6kl: use pre-assigned cookie for remain_on_channel and mgmt_tx
Date: Fri, 31 Jul 2026 14:34:59 +0200
Message-ID: <20260731123509.1975281-4-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260731123509.1975281-1-arend.vanspriel@broadcom.com>
References: <20260731123509.1975281-1-arend.vanspriel@broadcom.com>
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
index d81825413906..609d458ca6c5 100644
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
index 6c29f0bcec9f..2140fddba8ba 100644
--- a/drivers/net/wireless/ath/ath6kl/wmi.c
+++ b/drivers/net/wireless/ath/ath6kl/wmi.c
@@ -596,7 +596,7 @@ static int ath6kl_wmi_tx_status_event_rx(struct wmi *wmi, u8 *datap, int len,
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

