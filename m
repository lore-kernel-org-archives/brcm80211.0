Received: from mail-oa1-f97.google.com (mail-oa1-f97.google.com [209.85.160.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D70F374A1D
	for <brcm80211@lists.linux.dev>; Sun, 26 Jul 2026 19:26:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785093963; cv=none; b=SzJHbkRtmaOcvOHgDz5TYxbx50/IXY+zc/kAkKGjfYFPuvyHBNwML1SSro92q3+edSxaG5C5cu8nQLhLp9yHdZshPtCGW72Gf3bm01qGoC9WFAoeWyIV3KNHXjX+QYAJCgYcpt4EiYRj1DVZVFVavStkNMnqJw1CyyN/luXXJW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785093963; c=relaxed/simple;
	bh=x5MXwj1d+VB1odu+qOXn2Ic0Y+N5eUhDb+btCILvx44=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=d3lZ18pFsl5617Ia7TVJIusmWvS8FUP+WCDOqpWkNRtawh95dEsQX0+si9JjafEwFscbcD/4M7Uc6XR++nEamXBNcZ4fLPh9Bw4qDSNEjrTo+xGoiVhZExn4KCgewbTtRIKC1irkLkqiL4fyaXAFIgy+SqnxWccg11tUdJWrO8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=DJltT2pP; arc=none smtp.client-ip=209.85.160.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="DJltT2pP"
Received: by mail-oa1-f97.google.com with SMTP id 586e51a60fabf-45691990234so1318652fac.3
        for <brcm80211@lists.linux.dev>; Sun, 26 Jul 2026 12:26:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785093961; x=1785698761;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n4PlKcANzq+y1Rq4zco4LLPjQUEuNl07QXAtQYWq7XU=;
        b=ms0QoUzAL3qExnip2HpO/CQ2cHtp9uRbbTpkXrKHJwKGixFjTFT+MErcIVKqDhKIEZ
         ZgoAEMRXgEP80eoJndBAhKu9RRI9uJx0+e3/hY/7QkeP6vHhbkBhEwXbLWHTLIsKo9XU
         mvjVBtNl0J4wRN9TI8+JbR99E6upJV3xhH6Uo7dCcsmcz4AwG5uxo9kI0xC5cn7JYegy
         5es/POYYOIA4R4vXphxJpoiNP7x4416OX3eevTLtnZHX1nzhwSLrYIdOB/5Y1/xtAiZQ
         tWMD1AT/yIgMysPxokdbuAmtny2+3li4jwfWZ06mPJ54dXXpVPXNreqW96yIOQP984Tp
         2EBw==
X-Forwarded-Encrypted: i=1; AHgh+RpUpqWiM93+ab+v7NnWX+XkKFOCP2dsC7a2MEKnWgQTs9UWMdehMc14+kzT7AX/V1G2jLoH+NjYtEA=@lists.linux.dev
X-Gm-Message-State: AOJu0YxreKXGvEKlrAWeJbk0QPrhUftoMAzUUvLbmnv2KSfx33h1rceO
	S/aMgIkUzld2tjnHXGxJGZ0Hg9lIpOThfu7BTlBDCq5EiKF4FAgDTTLZc4NpPYZVLVOqvtKjYvZ
	MuHkrmvioWWUdPPXelYBrCGng77n/l5tG4Zi6aeIIxigAoibvrDMHLh9/S571Lr0dkuQeF5jxEx
	e5lsDH+yoenHfZ80EZV9RpA47vzwwl4dkBo85KFfZgPwaCrMsFHFgS/G33j2dneimNdZdrcvG89
	wG7K/KzWtvgYL+Ki9UDzA==
X-Gm-Gg: AR+sD130NbOEBILZcaz/oHJq/J64lqba+dC6gFggox4gOmTV2cxoyei7biy8mpCK3QR
	h4K2tBicInPaVMwbcTfNM9iqrLMQTx8xQcSH11ip4cb3sUEazjllCgE5cGC19vN+qi8UGaCsIbT
	WprypM4Ktfa7nOsmZNFglVc1BahgeQ1LTWx+n3OJX4c3Pi0W05rqHh0CxAp4O7pppbLOyoaVdHO
	BHBC7/tzfs/89yAvkKBA7R5Z0LjZovZm21B2HbY1OXIbXafavoEN3Ey8NvHEYpEAIm9yv8ZgvyK
	T0mBUZ1XDg0nYqeQU4IhXFkj4JphzB9s+endpc8sOgqCfpXHKhX73dfGXqHLg6kr+8XygxaHS6p
	9x00AhzVEsKNL8jbNVrsbAPx5Z10NaPr3BVtKBZLI+M7vKoZmQ8k+Lkt5B5LxAc0X4vrVGsXkZO
	fLnuKjvK4Vajzo9CXh3L2YGE8DnxjfFEMPDPg5Gd8=
X-Received: by 2002:a05:6871:4702:b0:448:8bdd:8358 with SMTP id 586e51a60fabf-457f2479f05mr4770764fac.15.1785093961226;
        Sun, 26 Jul 2026 12:26:01 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-26.dlp.protect.broadcom.com. [144.49.247.26])
        by smtp-relay.gmail.com with ESMTPS id 586e51a60fabf-45766ec69f3sm1119859fac.6.2026.07.26.12.25.59
        for <brcm80211@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 26 Jul 2026 12:26:01 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cae455cf6dso32939435ad.2
        for <brcm80211@lists.linux.dev>; Sun, 26 Jul 2026 12:25:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1785093959; x=1785698759; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n4PlKcANzq+y1Rq4zco4LLPjQUEuNl07QXAtQYWq7XU=;
        b=DJltT2pPLCrWuS6+z3RcvfKFk/ELdLETFHoZtt2j1i8KWjP2qE6hhVs2jg0KUf9XDE
         tA69SUoQ17wlyIys2hpWs7AGMStehwddz9MDQEepuHUP2yubxYcv5r9NF5hrzQNT+Tt8
         YY4DbPoud+hM9gepjK8fb/PZJfFlRq/u82Vl0=
X-Forwarded-Encrypted: i=1; AHgh+Rr+nuKliqfHbdf/ZDKeCalLs8ITygOaHbyU26hFnHxKaMBuKHkLNeDShRL/td9ygLk7hGVU7Krvpwo=@lists.linux.dev
X-Received: by 2002:a05:6a21:6196:b0:3c3:bbe6:95b1 with SMTP id adf61e73a8af0-3c67dd8a07amr6021250637.24.1785093958749;
        Sun, 26 Jul 2026 12:25:58 -0700 (PDT)
X-Received: by 2002:a05:6a21:6196:b0:3c3:bbe6:95b1 with SMTP id adf61e73a8af0-3c67dd8a07amr6021228637.24.1785093958263;
        Sun, 26 Jul 2026 12:25:58 -0700 (PDT)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc44cb92sm38355795eec.13.2026.07.26.12.25.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2026 12:25:57 -0700 (PDT)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	Arend van Spriel <arend.vanspriel@broadcom.com>
Subject: [PATCH -next 04/10] wifi: wil6210: use pre-assigned cookie for remain_on_channel, mgmt_tx and probe_peer
Date: Sun, 26 Jul 2026 21:25:35 +0200
Message-ID: <20260726192541.2816743-5-arend.vanspriel@broadcom.com>
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

Stop overwriting the pre-assigned cookie in wil_p2p_listen(),
wil_cfg80211_mgmt_tx(), and wil_cfg80211_probe_peer().

For remain_on_channel, store the pre-assigned cookie in p2p->cookie
instead of incrementing it. All cancel and expiry callbacks already
read from p2p->cookie so they pick up the correct value.

For mgmt_tx, remove the defensive "cookie ? *cookie : 0" guard;
cfg80211 guarantees a non-NULL cookie pointer.

For probe_peer, store the pre-assigned cookie in req->cookie instead
of the CID value. The CID is still available via req->cid for STA
lookup in wil_probe_client_handle().

Assisted-by: Claude:claude-sonnet-4-6
Signed-off-by: Arend van Spriel <arend.vanspriel@broadcom.com>
---
 drivers/net/wireless/ath/wil6210/cfg80211.c | 6 ++----
 drivers/net/wireless/ath/wil6210/p2p.c      | 2 +-
 2 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/ath/wil6210/cfg80211.c b/drivers/net/wireless/ath/wil6210/cfg80211.c
index 5f2bd9a31faf..6ebd340c8ef7 100644
--- a/drivers/net/wireless/ath/wil6210/cfg80211.c
+++ b/drivers/net/wireless/ath/wil6210/cfg80211.c
@@ -1488,8 +1488,7 @@ int wil_cfg80211_mgmt_tx(struct wiphy *wiphy, struct wireless_dev *wdev,
 	 */
 	tx_status = (rc == 0);
 	rc = (rc == -EAGAIN) ? 0 : rc;
-	cfg80211_mgmt_tx_status(wdev, cookie ? *cookie : 0, buf, len,
-				tx_status, GFP_KERNEL);
+	cfg80211_mgmt_tx_status(wdev, *cookie, buf, len, tx_status, GFP_KERNEL);
 
 	return rc;
 }
@@ -2399,13 +2398,12 @@ static int wil_cfg80211_probe_peer(struct wiphy *wiphy,
 		return -ENOMEM;
 
 	req->cid = cid;
-	req->cookie = cid;
+	req->cookie = *cookie;
 
 	mutex_lock(&vif->probe_client_mutex);
 	list_add_tail(&req->list, &vif->probe_client_pending);
 	mutex_unlock(&vif->probe_client_mutex);
 
-	*cookie = req->cookie;
 	queue_work(wil->wq_service, &vif->probe_client_worker);
 	return 0;
 }
diff --git a/drivers/net/wireless/ath/wil6210/p2p.c b/drivers/net/wireless/ath/wil6210/p2p.c
index f20caf1a3905..6d2cadca259f 100644
--- a/drivers/net/wireless/ath/wil6210/p2p.c
+++ b/drivers/net/wireless/ath/wil6210/p2p.c
@@ -144,7 +144,7 @@ int wil_p2p_listen(struct wil6210_priv *wil, struct wireless_dev *wdev,
 	}
 
 	memcpy(&p2p->listen_chan, chan, sizeof(*chan));
-	*cookie = ++p2p->cookie;
+	p2p->cookie = *cookie;
 	p2p->listen_duration = duration;
 
 	mutex_lock(&wil->vif_mutex);
-- 
2.54.0

