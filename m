Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 319E741F7FA
	for <brcm80211@lists.linux.dev>; Thu,  9 Jul 2026 12:23:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783599823; cv=none; b=RUJXh92xq4vct6LHv6dXDvM3wicAqOV17pqZtqBfqWJAjizZ4Tq0ipobGolRmeq0F1Ppk7PZkcUFW7qMjpmkEIF3+X6z/Ljdrt+kHY1A252uWm30Ok22KClFgDKJYa20jtsTTLl7CdTjZNMIfefTvucuetPgxhhDVG2/fRwUQU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783599823; c=relaxed/simple;
	bh=HIHypxlLytZGTSHRjU6ziFuzBnYOi9naX7hETgbaqpA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IQi7r15GaXVPOdEW+sQslumx0PHOvxx8u/Yj4v+Ur0V4MMasvhEnbqtD/nXDAKVqSSSF8LGGh95Q6AUOQ2Oe4O5D9HxV7qEyWyU+5f6NIlXGAH+vczUFFEMf5Hv0jQ8gecM44+tLgpVhxq33Ls5uwU5wXdNtYHp6KuMRRo9p5Bw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LeOGyfWP; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LeOGyfWP"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-847852f9bdcso239247b3a.3
        for <brcm80211@lists.linux.dev>; Thu, 09 Jul 2026 05:23:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783599821; x=1784204621; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0Ng1a+200d11qTnNY6DeqCpI1uBPK99U30nYmIrkcq0=;
        b=LeOGyfWPoVnSU2IBvOwxpb9Xa3dCNttuhdqjfq2noDI4NR1LnDqK/a6YZGtHATJD71
         dRr+VlDj76rFdPDE4YSwO9K4CkbNzDZaWh8YVSKH6Q0Xdg/ckvYB7mO2QwIb7i3M3OOA
         W/Mzb90xkPRhrdi+ZOHOH8fW6Bcz2QEJJyJGfXQ7PoFE7mgbSwZXH88OAVwioeBKIkM/
         VVqm9kP25Xs+7Lk70kPA0PAGPR+GMFcBP9WUNBGWU1br5ubIJCqdbs2rmkuf0P3jWvFh
         jagIqwht7DLiUswIVPYY9IdvC9euDiUvlngdb98L6glxWMc+mSEmMDB4p25SljMmd/dj
         0z9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783599821; x=1784204621;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0Ng1a+200d11qTnNY6DeqCpI1uBPK99U30nYmIrkcq0=;
        b=EY+01nJbk12qrJf/E1/uyinhZDEsrgdxaLT6WGJHy9au+SHQUW7oRlrJeq2YuEVGun
         HmXsYpvnhHey3gCG/rbW6ZTYhJH6eh0F3aAmZ0rdLhvpilt0tug0ywEuwzFFwsJ+U8JQ
         Yw9m+U5yRTO3XlL9zW1cMPIWbWLCkZbMVNw5vqgS9i9psDSgEg+xk56vuwsqXmv6dvmv
         M92CBXuskAuh2rQLpDjluNaMT4mPOWBBGwD3Xw675nwPDWmE6nmU9rYk/ITVn9rFMQc4
         GE6NJ+EvKWTuMedY7zfErsNROr1RTRl6zoCl+TWlmPcf2R68Lxhv/65Um1aj4hQIvG+K
         Cr+w==
X-Forwarded-Encrypted: i=1; AHgh+RrvtlOdshILpd+OabTVWtePeUyEyXelwTN436LcTxWbVMHjzaEwJyDFSOwiLmeo+EkABQGTUuhOw08=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx8HAtwgPlve8bJZxnv0tisKieEcjAyJx5ccLoknYBxA1qDU/B4
	sfz+xFN0ANB8lvIbNX4FsGHj+zK0b/RX9RO/Jl9C34PX6Q6ma0qkTfoN3yRJPiUr6pz3Tg==
X-Gm-Gg: AfdE7ckFf0oW5hxDOtkAx3qkdX2JjvUROu4MRjNddlN7AGRrQHUpjjuEHzNAJvrIZsF
	mPyH0wmWNbgStjaiuIJi8EPhJek9IhovpLBvd7ibtpVJkMhnGSvS3F6V/OkCSgyXBI9pq+Yw3yp
	tLgXc1w+8P8mIX3+tuk0kkr3lHqdRTPogXEp98nfM5A9M9hoMM+OIVDn+D6i88h3e+sbHl5iTxT
	Aldy3hanUEJ0zmz7/brDVRcYmnBMFI2b5RM4HmEClKUrPkS3fnkAAOq5QN7+/ltRZ5YUVItu9dE
	erFCpbd06C+ovkpJEO/ifmZpsb9Fn4n5Lf5q/KE+U8uw7LyX3zVP/3YZb2ym3wVPurXQAwRjQJz
	ZI/BHsKJ/v+9erMhxKPbmmMe5kAqMXZGmR9mSvmeSJJSJ1H6d3+hjYrgcHHQ5h3IDEoj+wAv3da
	0vKeMZDhrfymtGxdJGdMfBeleeqwaXjFdRDH8wzmh6E+xVRaXcjvogiPqO9nmDMFpad6UYxg5CD
	lHmuWc3nBAI780F
X-Received: by 2002:a05:6a00:b47:b0:82f:99c5:868d with SMTP id d2e1a72fcca58-84842fce286mr5194785b3a.4.1783599821422;
        Thu, 09 Jul 2026 05:23:41 -0700 (PDT)
Received: from 3155-XPS ([58.227.72.130])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-848490f7bd8sm2249744b3a.13.2026.07.09.05.23.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 05:23:39 -0700 (PDT)
From: Bogdan Nicolae <bogdan.nicolae@gmail.com>
To: arend.vanspriel@broadcom.com
Cc: Bogdan Nicolae <bogdan.nicolae@gmail.com>,
	linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org,
	Bogdan Nicolae <bogdan.nicolae@acm.org>
Subject: [PATCH] wifi: brcmfmac: cyw: clean up PMKID and cookie code
Date: Thu,  9 Jul 2026 07:23:15 -0500
Message-ID: <20260709122315.11400-1-bogdan.nicolae@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Avoid setting packet_id to cookie, which is always 0. Instead, use an
increasing atomic counter. Avoids mismatches of completion events later
in brcmf_notify_mgmt_tx_status, where packet_id != vif->mgmt_tx_id is
checked.

Also, zero out auth_status on initialization. Otherwise, garbage will
leak from the stack to the firmware (when bssid is less than 32 bytes
and/or when params->pmkid is set). Then, pass the params->pmkid to the
firmware (without it, the firmware caches a garbage PMKID on successful
authentication and denies a subsequent association request that includes
the PMKID).

Signed-off-by: Bogdan Nicolae <bogdan.nicolae@acm.org>
---
 .../net/wireless/broadcom/brcm80211/brcmfmac/cyw/core.c   | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cyw/core.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cyw/core.c
index ce09d44fa..cca53ff19 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cyw/core.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cyw/core.c
@@ -23,6 +23,8 @@
 #define MGMT_AUTH_FRAME_DWELL_TIME	4000
 #define MGMT_AUTH_FRAME_WAIT_TIME	(MGMT_AUTH_FRAME_DWELL_TIME + 100)
 
+static atomic_t brcmf_cyw_mgmt_tx_id = ATOMIC_INIT(0);
+
 static int brcmf_cyw_set_sae_pwd(struct brcmf_if *ifp,
 				 struct cfg80211_crypto_settings *crypto)
 {
@@ -155,7 +157,7 @@ int brcmf_cyw_mgmt_tx(struct wiphy *wiphy, struct wireless_dev *wdev,
 
 	memcpy(&mf_params->da[0], &mgmt->da[0], ETH_ALEN);
 	memcpy(&mf_params->bssid[0], &mgmt->bssid[0], ETH_ALEN);
-	mf_params->packet_id = cpu_to_le32(*cookie);
+	mf_params->packet_id = cpu_to_le32(atomic_inc_return(&brcmf_cyw_mgmt_tx_id));
 	memcpy(mf_params->data, &buf[DOT11_MGMT_HDR_LEN],
 	       le16_to_cpu(mf_params->len));
 
@@ -200,7 +202,7 @@ brcmf_cyw_external_auth(struct wiphy *wiphy, struct net_device *dev,
 {
 	struct brcmf_if *ifp;
 	struct brcmf_pub *drvr;
-	struct brcmf_auth_req_status_le auth_status;
+	struct brcmf_auth_req_status_le auth_status = {};
 	int ret = 0;
 
 	brcmf_dbg(TRACE, "Enter\n");
@@ -208,6 +210,8 @@ brcmf_cyw_external_auth(struct wiphy *wiphy, struct net_device *dev,
 	ifp = netdev_priv(dev);
 	drvr = ifp->drvr;
 	if (params->status == WLAN_STATUS_SUCCESS) {
+		if (params->pmkid)
+			memcpy(auth_status.pmkid, params->pmkid, WLAN_PMKID_LEN);
 		auth_status.flags = cpu_to_le16(BRCMF_EXTAUTH_SUCCESS);
 	} else {
 		bphy_err(drvr, "External authentication failed: status=%d\n",
-- 
2.55.0
