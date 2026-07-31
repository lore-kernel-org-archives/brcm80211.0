Received: from mail-yx1-f98.google.com (mail-yx1-f98.google.com [74.125.224.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A5D9414A2C
	for <brcm80211@lists.linux.dev>; Fri, 31 Jul 2026 12:35:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785501330; cv=none; b=lDvpvc5/Yz0HfLKCSJxbAzYdXoMd2JwHAtlgaCZ3f5Xg1qnxWAY/CvYwFggAbxtYODHNVVtXhcvH7QQCsH1APg96sykA24CeCx5+wfRadAZThJJSk7FN0DEbUomL9D+f3ua8VnUpLqRkbz5yT2RKlT+SeiMk/kM9b4vgKfP5Qn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785501330; c=relaxed/simple;
	bh=x5MXwj1d+VB1odu+qOXn2Ic0Y+N5eUhDb+btCILvx44=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DxHhvQ9udnKsmxFd61AfdUxGbIk7zRU9b6550yWh4Ix2jmt1Mtzk+qg3w5/u4ZVR7visEpDGXmpDNOZEFOVs94qA10cog6fhBolknYDu9CGEAD0FkqyUUbbuseRB3WOCN9ow1g/utrvmOUzJmyDVlilRCgbYGSa/8b7mPy1G5yQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=NjeZ5AbQ; arc=none smtp.client-ip=74.125.224.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="NjeZ5AbQ"
Received: by mail-yx1-f98.google.com with SMTP id 956f58d0204a3-664db84f074so1264291d50.0
        for <brcm80211@lists.linux.dev>; Fri, 31 Jul 2026 05:35:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785501327; x=1786106127;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n4PlKcANzq+y1Rq4zco4LLPjQUEuNl07QXAtQYWq7XU=;
        b=kzwoO7E9naEz7he4ywQK+I6DcSQZNRqwSiFRu85D/zzivvw1P8kLMvmkGL7cku/DrU
         RijivrW5nTAEWUppwlyeKAScBTrA5j9NWBWXSE4UY41gBFl7y2m2+PnjMByTCW2gHpbc
         znIX2mvQ24jUPaLQzBJHnztOSsdAF0X1CCi4IUjLEm4fMH/PaZ+VHuUZ6d6xTsMBrGwW
         CQUWkg8zaNkSFkPX54N2cdOFXbQFsO7ERTiVUtu0I3g+bpX96EPxxyLkOhOeBwHx47HH
         /cN+rL4w/P4nKkWAWliJpNnFURZuuWovVJb1J5zjJTgX6WQh9m02pIAluz6frQfVC4kP
         LkZg==
X-Forwarded-Encrypted: i=1; AHgh+Rp7xeLGV+UnMcD3ZRTd//5330Xd9lhe9zA69txmWEJ6Bf3CB4s4wVzZmd/IkVH0eTpZBaH6eV68vTU=@lists.linux.dev
X-Gm-Message-State: AOJu0YygETBvzF49OmWub8m4z3gZR8WwnzapwxI0XKUG+1Z6N2muE914
	vKVlBS3K+3n4dMCQm39aSCCSi0pKXjwM6uirCGTGAFbNRWRU7czwIcweuueEvXrYqrxTsUxq0q7
	s7oWZI6bkqMG1BDQFr20cJ76J+77jBuyi4nIJCT1he5jjBuOMuKLv1IkRdV81WFSJUtapDqDW/r
	owVnXtVwE993qtvbcYcBSXykBPyM0brV5+bycVXjHpy4SgKz29fxWY+sZOUQbJ5eRyz+AMoqilg
	hIJGZvJm2qkPhYPbYK12g==
X-Gm-Gg: AR+sD13mk7fCuI2l8jEY3gEBiZBXkfJPrU25I1lXOTeU/zy3qArl9Z+BdMm6SPoaSCs
	XqyF9+AVUQ3xp/HkNXO4cnhBdjeXp5BPUAfTl5OLAGkFMtGWrd7dBfaa/y/O5Mx/79eXbhbfnvo
	lqmzL4JroVb6SnaR7FpwNj0LZDkS5I73zQUeRdLMPm/qFVRuTjNUa0TZYr+YKqSoukT70zoZ4YT
	8+dj48gEvBgSVdrEX/8P0pz+aZ5hv5OVETpXmfIh85KsJCivxW25xafKgeq/mN6PDRHnD+gQRam
	flFf5eIeBf1X0aXcsnnE9sy4VZ9+6HXJcFDIU98gblKflLcRv3Ef3OscDxJzZxTtZN4nLMcPYG+
	W2XYxknB3EV4GsFngW+Z6CRTWysnv99VCbISIBG1colzSL69IxZBSxKF48mVrOb26MvXg0rjYgG
	vJJVrl0BYZlgwI53CDt88nRsln3SxylwPBHXIdTVI=
X-Received: by 2002:a05:690e:1406:b0:667:e441:bc0d with SMTP id 956f58d0204a3-66945377055mr1336129d50.33.1785501327425;
        Fri, 31 Jul 2026 05:35:27 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-26.dlp.protect.broadcom.com. [144.49.247.26])
        by smtp-relay.gmail.com with ESMTPS id 956f58d0204a3-669490ca614sm42560d50.29.2026.07.31.05.35.27
        for <brcm80211@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 31 Jul 2026 05:35:27 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cb5cc1e139bso602179a12.3
        for <brcm80211@lists.linux.dev>; Fri, 31 Jul 2026 05:35:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1785501326; x=1786106126; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n4PlKcANzq+y1Rq4zco4LLPjQUEuNl07QXAtQYWq7XU=;
        b=NjeZ5AbQ/S9rm7uFzYC18JYLtnJVInpcgBPc6u/KJn0Saj8vQql9Xlp1E8Ln1SMk0c
         hSSHF5adMmuZ3eT344rzCVSZK0RbDD0XwOSXcybJeYBSvcDLfMW0HlCpC+Ycmb87x0mm
         ynCclrAMDQxXxAIv11M6K0eHDIyL4sn52ixb8=
X-Forwarded-Encrypted: i=1; AHgh+RpOL7jQOAt6peDQ+e3HaKmoBrUTINiTicRr+JnjPaf8Kf59bFvWC9HQWdfWms9HFjbG5chunSeQ2mQ=@lists.linux.dev
X-Received: by 2002:a05:6a21:d84:b0:3a3:a9c4:3d60 with SMTP id adf61e73a8af0-3c91b1156f0mr1868238637.27.1785501326102;
        Fri, 31 Jul 2026 05:35:26 -0700 (PDT)
X-Received: by 2002:a05:6a21:d84:b0:3a3:a9c4:3d60 with SMTP id adf61e73a8af0-3c91b1156f0mr1868211637.27.1785501325637;
        Fri, 31 Jul 2026 05:35:25 -0700 (PDT)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153dd9be04sm5187041eec.9.2026.07.31.05.35.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 05:35:25 -0700 (PDT)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	Arend van Spriel <arend.vanspriel@broadcom.com>
Subject: [PATCH -next v3 04/13] wifi: wil6210: use pre-assigned cookie for remain_on_channel, mgmt_tx and probe_peer
Date: Fri, 31 Jul 2026 14:35:00 +0200
Message-ID: <20260731123509.1975281-5-arend.vanspriel@broadcom.com>
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

