Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1B8E41CB4B
	for <brcm80211@lists.linux.dev>; Thu,  9 Jul 2026 12:16:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783599393; cv=none; b=W+MfmOWXjsIlgmvBpZ05xX0uwumt3TufFsiPTMsCYwDgjEMerf1SrMUPmO1Ddmu00NJniyH6D6V9t86bUPlZA3eDPIttagnK9uxYnu6lDYYo8XrSp54PtBSB97CLqKXC+mAcvPTJ0NZVIacE3FK9QiNE9DQZuPdDgouK3LqvfvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783599393; c=relaxed/simple;
	bh=HIHypxlLytZGTSHRjU6ziFuzBnYOi9naX7hETgbaqpA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QJXSHZqPAEDR7zLFF9yr4LCF4xr3kr7hS7iUWkfz+13LBStz55amyfdxfcuHE6EU4pZ7IDw+3GuyhvOs4TX3VO9BWDAY2DrendRFF9Wp380CCDpzh5zVBUiceBPyvqexSv6D2GL7imD6NjqakLB6V4TWfJ3+Q4Ctst10NuBFKfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=reject dis=none) header.from=acm.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-845e5504f54so299869b3a.3
        for <brcm80211@lists.linux.dev>; Thu, 09 Jul 2026 05:16:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783599391; x=1784204191;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0Ng1a+200d11qTnNY6DeqCpI1uBPK99U30nYmIrkcq0=;
        b=DdXSD+gCSzCwcIdOdNDpn3L8PoL3Wby1u1dRQKB3DHbttvvmzbZRb/AcKLP4Tcyoh0
         9MaZIs5wwsR7IO8y3c9QPlHxrBviN/ZdIWVLylkUVRrHckmqjwnRgVz7rcu2Mn/WYGwa
         Gga6kYKUp5yJqEixEg748uMr9uJMXMFjjBcmqI1/njDMD0erGwOc/NDvHURe8cuACM/c
         iatUMqtOy6sxmj9KRl2XwQt+qtBNa/a+wpqAQkTULXPH7LJj2Tryv1mUK3cFkUTRWYnr
         DDkC1C70rNmRjwnsRm9+X1av5DOFyaw9ji1FOJnWMInnK7f99R06EXhdGVtA8Jr6J3vb
         vtJg==
X-Forwarded-Encrypted: i=1; AHgh+RofvY9IrqdoknhcvbAmgOjcqil71tqmd9BXkN3AKV7eBkPx9wM14H6SxdTd7evckVHsHw5wENb7Fds=@lists.linux.dev
X-Gm-Message-State: AOJu0YykothtQDsqIveey8HukTDveKUSVfY2LQ/E6I07M5YvJDTqKf2c
	oct4S5Y9sUxXzjcfCdwA4g2E//VOFSK4lWPE11fNlkimGX0ooxbd2HuxeZcVWZ20mlkdGQ==
X-Gm-Gg: AfdE7cnx8fR8xJggiLoII6+4NR4gIsgLNm7UnLCpKEndFzPzURp/G22Wnf9p8yr/cIz
	lCznmzb57auc/BS9NJOGG9XrZtNSMW44kyjX87LfO12VZSLLDFb/piaCiusVRAGoekutApobe8m
	rG7RMcFd0jMIdOysXpJ/AQ0wTn7ogYx/F3SA6qgj6bKRoyef/uFimbp7a724t4wp0bFHEIhRemK
	0ojxrTaIjjawbmdYRlYimWrPHtnwAn19o5lrDlbelpBIF7ED6U8g4UyUiroIKBWAnq+gLEMlB9B
	EH1W3jSpLMLnzjhZkiOSy5O/DKGf4ikcOHzQNTkNa4tdCJ16EcqC4mMkrRxV30TndxE8RpOiob+
	EbAypRNTPLAD4RYJT4qBqlHSjzsPlItLHWSKufYE8B4HdE6marxUSqhqIK1yM4jNnvNoRFwRD46
	0LD0DR9WEqPvQgEGjZRMumIcIP1Ba8c1OWhoxpmOTuQTUF7rHmy39oZiFWPOpFbhMLhPI5diqUd
	VlEVJshr3rnTg==
X-Received: by 2002:a05:6a00:a0c:b0:842:3932:71cb with SMTP id d2e1a72fcca58-84855fe8b89mr2198327b3a.4.1783599391199;
        Thu, 09 Jul 2026 05:16:31 -0700 (PDT)
Received: from 3155-XPS ([58.227.72.130])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8486479b378sm534048b3a.12.2026.07.09.05.16.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 05:16:30 -0700 (PDT)
From: Bogdan Nicolae <bogdan.nicolae@acm.org>
To: arend.vanspriel@broadcom.com
Cc: Bogdan Nicolae <bogdan.nicolae@acm.org>,
	linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH] wifi: brcmfmac: cyw: clean up PMKID and cookie code
Date: Thu,  9 Jul 2026 07:16:05 -0500
Message-ID: <20260709121605.10974-1-bogdan.nicolae@acm.org>
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

