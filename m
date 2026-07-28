Received: from mail-pj1-f99.google.com (mail-pj1-f99.google.com [209.85.216.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEF2F253B42
	for <brcm80211@lists.linux.dev>; Tue, 28 Jul 2026 14:46:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785249968; cv=none; b=TuUbe+ovPtxGNUXmx91tHSAHTY0c5BJvT/KrzW0Ty1t0QH+X7siWEHRgpWoBn787RnbqMTOntkSvFF6Q0t2AuGso+c0G61PbGO3/kr4dWEBb4WIZwBGVy+Qep8nN94paW3D2nNY8cuSlgqQBN4pqlIVel3T0YgEi+7MzPFRAUAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785249968; c=relaxed/simple;
	bh=x5MXwj1d+VB1odu+qOXn2Ic0Y+N5eUhDb+btCILvx44=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IiespQ62uL+zZPqJwuF/SvprgK0K8fbhSompEbDAnUFILePr/GYSso7gPww5J3z6GETOEdMomS/aNrFY0Iw6RFusIKvQ65X9K8K2uSW9MALGhgWZL6dARAzB9L5lwpu1hkiy8P4XBQkHOzEiW4UTY+iZgrPQfToXIMoLbuaIL44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=A90eSTf+; arc=none smtp.client-ip=209.85.216.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="A90eSTf+"
Received: by mail-pj1-f99.google.com with SMTP id 98e67ed59e1d1-38e071ed6aeso3118086a91.0
        for <brcm80211@lists.linux.dev>; Tue, 28 Jul 2026 07:46:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785249966; x=1785854766;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n4PlKcANzq+y1Rq4zco4LLPjQUEuNl07QXAtQYWq7XU=;
        b=FhsrRM/b9UuptnmaM5KdSJWmf7pmOKw/bzffik3YGYN4IGlHDdx3WrK+N6HGZSW816
         7QKO9jTDkmf11IVY2nTPiOjBMi476JaUjlxCzNID5DPACYfc/IjcW6VoyoRVAT1RSRm3
         e56uL/HNkjvtCoyCSA409Ioq6ZF7vBisIwV/aaNdVmH2y3re3RwKdhiKnuFvi12Uo/QH
         WCM2ezhra0SAbw59mJp8wRTFgOlh5hU9pfwdJNAl3DhIAnOaqwVJUeIn5SAZgbUHpY8X
         785nu8Chhotz+AdiJO3g5ZDisJjNKpt9JwQhR5iH9z/+NiaNh8ZFUIBQLTbTEW87r6Xj
         u7/Q==
X-Forwarded-Encrypted: i=1; AHgh+RpUP4ZFWkVUazgV5M3nEP6b/+EQ6McWUNZOruyUbly3JypbKLZFxO9rqDedAJGYL5h/cdFziiR/nRg=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz+YugVcik3+Xd2iQj/w1h+Osj4OKCn3/B0NU7EtU1vSAD75uqH
	C9BK4BuuDrY1zbPD/Cx+3fB2ZC7S4vBZBCOceKjpadQX/NL67QQqa9eeAW7xmDvYN9T07GbIn7W
	0XYO2NqXLB0OrmA8ciDnzC8fs6BSQEgxFdYGDeGrugaLJetUSskOqalkiBLK9oTsl9+3N8GjH9N
	WOiYOK/QWJcv8az4HAQTqo0YcO7K/xrJtlK0Xpyy27OsRMIHk+VuSSQYsnQvgur/+O+aZqkIpk1
	UaiWxUKvBcf5K/SVrr1Rg==
X-Gm-Gg: AR+sD1182gCwLS3PsKdl2h5wRv8LVj9lCDo4eyWlNjWo+4DmEZ4WVHnufoHTUDDjNpx
	Ob5Xjsdtm8zpHqOvBlrhpblXHa5YaRekQRQXb2X5qVxCia3fXheqQfbkSFWKT6mSUlhk0W3+1yA
	5W0zGc7pAYMGDZDzuAjlkWA0IAcRKbUMiQu70bnF2GgEsoWoV6K3wBZy6vZO0F4Keqqphsg3YN8
	TgB+9st5ndcKa+M439JCP/IkxbCGGMVKDY78SMwLTq1qsGGGsqowODrWG04KbZF2SFPE5+aO1VI
	iIqeLI1L9IeYeSzlRl69Sn27d1Lx3x3UpSlYrKl1zfN6cF1zYCva8dkbG1j1fMK8NG6FU2b6A6A
	PVBdM2S7P2h/ec9teAR3kZOlbrzMT+8iT/z5qdU6cTW/GWUuDLqTPAf0cPd7+AmgfOmwT/ERLid
	7tX6IbmzsyKBXBnk1408UkNHVPb8xhov1tNnjXxts=
X-Received: by 2002:a17:90b:288b:b0:38d:a150:ee04 with SMTP id 98e67ed59e1d1-38f6a5430bamr2999689a91.30.1785249966008;
        Tue, 28 Jul 2026 07:46:06 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-73.dlp.protect.broadcom.com. [144.49.247.73])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-38f642c3078sm221789a91.5.2026.07.28.07.46.05
        for <brcm80211@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 28 Jul 2026 07:46:06 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92ac0a54110so517881085a.2
        for <brcm80211@lists.linux.dev>; Tue, 28 Jul 2026 07:46:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1785249964; x=1785854764; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n4PlKcANzq+y1Rq4zco4LLPjQUEuNl07QXAtQYWq7XU=;
        b=A90eSTf+X1mpAD7ETetkMuJZZSldwqGpI2+pCRCZZv/zl1U8B+iFk7mc6WgAMjIOrs
         dWmOjaphD7KlKemzZjGGkX5el7F2FBOP1LUW0sYv3kmRe1U5DcKJg4A/DLj0ARbZsY7+
         9XkYD+za53b0C+lmTcYwjHwETB4OQ5Q3LKQ/Y=
X-Forwarded-Encrypted: i=1; AHgh+RrG5gPiUE3dlkR5CTSuOefNONHQHC4ct/upbv5859HMddNz0nrI7spPhyL50frzBjg+vIJPg50WoHg=@lists.linux.dev
X-Received: by 2002:a05:620a:4587:b0:92e:63bf:9583 with SMTP id af79cd13be357-93302792557mr271035685a.63.1785249964542;
        Tue, 28 Jul 2026 07:46:04 -0700 (PDT)
X-Received: by 2002:a05:620a:4587:b0:92e:63bf:9583 with SMTP id af79cd13be357-93302792557mr271030085a.63.1785249963953;
        Tue, 28 Jul 2026 07:46:03 -0700 (PDT)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-932de519154sm878659685a.5.2026.07.28.07.46.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 07:46:03 -0700 (PDT)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	Arend van Spriel <arend.vanspriel@broadcom.com>
Subject: [PATCH -next v2 04/12] wifi: wil6210: use pre-assigned cookie for remain_on_channel, mgmt_tx and probe_peer
Date: Tue, 28 Jul 2026 16:45:41 +0200
Message-ID: <20260728144549.2207061-5-arend.vanspriel@broadcom.com>
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

