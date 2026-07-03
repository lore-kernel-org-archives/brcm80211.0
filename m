Received: from 011.lax.mailroute.net (011.lax.mailroute.net [199.89.1.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 469A52F1FEC
	for <brcm80211@lists.linux.dev>; Fri,  3 Jul 2026 22:43:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.89.1.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783118620; cv=none; b=CTui5+PXxkqyEteH1UEGSYbmqTVzvFdr29R4kFvF//eVJHJm81qy6h2rCwq/q7LfstxhcWFN5RSXEkhQOXlpPcoeFuhs1A4SQ0aZuhMjJa+AweQNskeDUJt8YyZgJ2dmrHVSMLq3OntmqHfjmYJkg7ZOj6KRQxprFmgPQxZ0+5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783118620; c=relaxed/simple;
	bh=eoZe2aeMSGB0yLehGKbPfX7pLT30XOJhOwGSvyjPs40=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=K8GjUHJ+w1T9leY6JNYVAQXEw9p9UqrYW1Y3Y2TcNb3Yzbi88GZe3nJYQLA+tqnIVe7nn2kIhYWsHl7aaoOYGXcPyl6klLWHXzqSKBNWSxTA6N+a6O1IVUR4hDUNcBqUbud74qsEyDq50dgaNmAn/Ss2cmGdReckF+j3jqvrtNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org; spf=pass smtp.mailfrom=acm.org; dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b=pEnOhUOu; arc=none smtp.client-ip=199.89.1.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b="pEnOhUOu"
Received: from localhost (localhost [127.0.0.1])
	by 011.lax.mailroute.net (Postfix) with ESMTP id 4gsTLY5ZBnz1XM6JG
	for <brcm80211@lists.linux.dev>; Fri,  3 Jul 2026 22:43:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-type:content-type:subject:subject:message-id:date:date
	:from:from:mime-version:received:received:received; s=mr01; t=
	1783118612; x=1785710613; bh=9crJ0MXL8cyvtFFWI/xFl//GhDodklwUxXl
	E6rcG8t4=; b=pEnOhUOuyjYzxTMR4RLB3AarhRyLmV+plqIBZLkWmBbfWxwAY/t
	5F8FnCO9ecOiANoHi3DIDA1310ZgKTQlpU3BadS9Jg33uDQWL+T4JsZLKJD9hB4G
	vCc5Aj+fVj5kIrL8Kp7MdTda8bfrCa+Su+HNxNTabfpYCFqnxDsXcheVNfsLVO+f
	+b2McnRQY1WmFxP70VrAuS/ttUsABkbz5BWMPzMFYHzubCCfNRYngp5igu5ic7IQ
	7WAD/9h/mkATY4NsNezBvkCllnPD9R6eP/kQbtarB6l5MfHUL48CYEFT4uQ8soYx
	VRdZNQiHCApYnsiQJjn43IXQkQQLCexv/Hw==
X-Virus-Scanned: by MailRoute
Received: from 011.lax.mailroute.net ([127.0.0.1])
 by localhost (011.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id ECvFmRxiz1X3 for <brcm80211@lists.linux.dev>;
 Fri,  3 Jul 2026 22:43:32 +0000 (UTC)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bogdan.nicolae@acm.org)
	by 011.lax.mailroute.net (Postfix) with ESMTPSA id 4gsTLX1ZLJz1XM2FV
	for <brcm80211@lists.linux.dev>; Fri,  3 Jul 2026 22:43:31 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6984520d66cso177933a12.3
        for <brcm80211@lists.linux.dev>; Fri, 03 Jul 2026 15:43:31 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rrci1rYCN0HO57WUgUGA2wD48ivRY6H3Y1evex6MbhcC3XNI52vJT+peCkMF6zLQfIoe5NnefmAA24=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywko0J3IG15WCoPjcDytgJ6VZWZPUCbbogGhVaJjBkwJqy7T0fR
	fDFB4D8klXj1z3H+rAPS1ubunCv2OadzmOANcEvpw+hmcMHpYmJwFEvGpr3hjT1j64UgrVNgNxB
	nFXRMwHeW4bm25AJltvAwz1sbJA5V0Ck=
X-Received: by 2002:a17:906:7952:b0:beb:3449:5fff with SMTP id
 a640c23a62f3a-c12e3cb2fe1mr35273866b.0.1783118609795; Fri, 03 Jul 2026
 15:43:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Bogdan Nicolae <bogdan.nicolae@acm.org>
Date: Fri, 3 Jul 2026 17:39:51 -0500
X-Gmail-Original-Message-ID: <CA+ORkNQPL_qdLOSC2Ae0Y7-wihKVRaaO-DUajN-3rpjzyoEtjg@mail.gmail.com>
X-Gm-Features: AVVi8CdXe3pSxerqc5jsVpcP3oM9iW5EoM3Wh0UnMLjs3qoByk61FbqQ8rG9ylA
Message-ID: <CA+ORkNQPL_qdLOSC2Ae0Y7-wihKVRaaO-DUajN-3rpjzyoEtjg@mail.gmail.com>
Subject: [PATCH] brcmfmac-cyw: clean up PMKID and cookie code
To: Arend van Spriel <arend.vanspriel@broadcom.com>
Cc: linux-wireless@vger.kernel.org, brcm80211@lists.linux.dev, 
	brcm80211-dev-list.pdl@broadcom.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

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
.../net/wireless/broadcom/brcm80211/brcmfmac/cyw/core.c  | 9 +++++++--
1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cyw/core.c
b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cyw/core.c
index ce09d44fa..06e5dc79c 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cyw/core.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cyw/core.c
@@ -2,6 +2,7 @@
/*
 * Copyright (c) 2022 Broadcom Corporation
 */
+#include <linux/atomic.h>
#include <linux/errno.h>
#include <linux/types.h>
#include <core.h>
@@ -23,6 +24,8 @@
#define MGMT_AUTH_FRAME_DWELL_TIME     4000
#define MGMT_AUTH_FRAME_WAIT_TIME      (MGMT_AUTH_FRAME_DWELL_TIME + 100)

+static atomic_t brcmf_cyw_mgmt_tx_id = ATOMIC_INIT(0);
+
static int brcmf_cyw_set_sae_pwd(struct brcmf_if *ifp,
                                struct cfg80211_crypto_settings *crypto)
{
@@ -155,7 +158,7 @@ int brcmf_cyw_mgmt_tx(struct wiphy *wiphy, struct
wireless_dev *wdev,

       memcpy(&mf_params->da[0], &mgmt->da[0], ETH_ALEN);
       memcpy(&mf_params->bssid[0], &mgmt->bssid[0], ETH_ALEN);
-       mf_params->packet_id = cpu_to_le32(*cookie);
+       mf_params->packet_id =
cpu_to_le32(atomic_inc_return(&brcmf_cyw_mgmt_tx_id));
       memcpy(mf_params->data, &buf[DOT11_MGMT_HDR_LEN],
              le16_to_cpu(mf_params->len));

@@ -200,7 +203,7 @@ brcmf_cyw_external_auth(struct wiphy *wiphy,
struct net_device *dev,
{
       struct brcmf_if *ifp;
       struct brcmf_pub *drvr;
-       struct brcmf_auth_req_status_le auth_status;
+       struct brcmf_auth_req_status_le auth_status = {};
       int ret = 0;

       brcmf_dbg(TRACE, "Enter\n");
@@ -208,6 +211,8 @@ brcmf_cyw_external_auth(struct wiphy *wiphy,
struct net_device *dev,
       ifp = netdev_priv(dev);
       drvr = ifp->drvr;
       if (params->status == WLAN_STATUS_SUCCESS) {
+               if (params->pmkid)
+                       memcpy(auth_status.pmkid, params->pmkid,
WLAN_PMKID_LEN);
               auth_status.flags = cpu_to_le16(BRCMF_EXTAUTH_SUCCESS);
       } else {
               bphy_err(drvr, "External authentication failed: status=%d\n",
--
2.54.0
