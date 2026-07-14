Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8651648A2DB
	for <brcm80211@lists.linux.dev>; Tue, 14 Jul 2026 15:04:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784041486; cv=none; b=LNbNHqE8B71imaa+lsccOf2UPFtjm9CmxpqSUUQcQi7Y1yG+M6/SD7DE597PEhwdx1H1lxWknqH6x04j4wDr4myvUeVnNcVW7ziqApZsfImB0DBbFv26BDk0/7qLEZ4FkE6BZ5yuxzup3mVPIuMzZ3rfStTtMcmeSF/W21Chb2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784041486; c=relaxed/simple;
	bh=zw7sWG9NMsbCDcycSEpB+JJ+Mh7QJC4TEmEfQVhsny0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kUle1t1O6ZM2xcbezWTZgjEp/k1OODudPTT2gKgv3nlE0xjxZmPw3AdSoYAb4WyvyYos88TWNQIfIvx1AJLEJtgvTOAoybfciea5S5MXag9StMIiY7zAlE9dBi44/1/KlbQZ4JZxIw4b7iljsfQmf54pn8FgHvkzTRZmPqJRNuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=em+lq+QO; arc=none smtp.client-ip=209.85.210.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="em+lq+QO"
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-7e938d8538eso844447a34.2
        for <brcm80211@lists.linux.dev>; Tue, 14 Jul 2026 08:04:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784041483; x=1784646283; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6ah3OjIXDJ8FGYTbK7t3P/0aF11VxI9dGNiWaxqwvQI=;
        b=em+lq+QOunQlDyf4sGTJTiBMdQgKYzjeLAjPcGuUMgVe8wrmEEcm87pGDc96yKXaQ3
         tr7/8P7ZwEnHVfH6xwky1aleYZRmAhZM4iE7MGZ3Z3mEQiBsV6/4sgeVQ/JQNYdhoGDU
         r0q/2hDy3+IqlUlv0O8VbaKZQe5sPUgig1rRLGvx4Kpw9oj41RLasvyARuASoGKvQRrc
         eVRvRmZOVxM8GFeSCpKEvPhebUYNtiz7d+wjlTj/nkQ0/Vl5vSDGs2OODkzyWkSEX+ai
         /9XheqqDjeNDn5M/Pwl6aRHBoU1Ra25nwkJdi1Vqyo8obcpDtyRkgXGhAOn0m+5TQw50
         AQkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784041483; x=1784646283;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6ah3OjIXDJ8FGYTbK7t3P/0aF11VxI9dGNiWaxqwvQI=;
        b=FKtb6p+DZtu4BYzcUxvHXvoA1LOKcj6XQVNL2xW5Sq4Oyc/HmMzuvC+9XuNH4N/p/T
         +jYLpqs4Bsic2wu4Z/gZRbYch4fHsERqHNMAu4bxmNC9xE4jRzOatHPQ+ZGBmM3lg3VF
         kwV//tDwUwUL/04f4fxCZBSn4BRtURoSBKHd3T0Tpx6WsIb6G6z0Q4agkPwu9NVsvwZL
         bBGLoaha2nSb4o7Fx3gQOkj0bRTwbn8LvyFnGWWF7hMTrKGnUOnPbzsNgxu7WmfAVOt+
         eWPet68YkF/CyddHF7O6gEpsyXtYfY23o6d7RSTXLYuAcL2NngknfDB7kFlFB/dDXcM0
         Kmow==
X-Forwarded-Encrypted: i=1; AFNElJ9dR9RTZ8pIoZzQ3/i8p9el+oLS1o7TlA2ioI94flFHScpXMrWxletHywfU8/gNq8759cdpA79iy7k=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw3+FRnrJf89XEHyFXsJKeNb2hIsHH0a0y6baxuyYvEIwGx+4Ru
	Q9r2sHIKnaStv0gP4ifda3wl2Zb4XO3WSjSKi7oBEuEZ7C1xfgeSBAEi
X-Gm-Gg: AfdE7clPTpOuJdiS5qGabRnXhbEosdzfLXIaJRK1cQsurepUMhW6QPV0xh35iY5MfQ/
	DA1MHk1nwY/g/7rHjDJybnNCAB5BV/gxAmBAffyvziMtW3YDVe7H6coEjKuJC4AEr+Y+vvMAKme
	3lHBjamRy9RaOtQ8byH8XXVa6yFCXjGC9f70gGqLLYo1cioT9EnPNMNwEG0RJXoAoH5zpfLQi7S
	OMh8fFHj8Zt1Vy1LMn3YkAPnZ0zgG2lX6pLqSMjCbdgSSi9y4SrYXkmhufeKCc5FQMFNXP/FRaO
	x8AGQpvu2dyinGXUtli2IVqh5EOZ9ZeUpbVUhDvbkx/r9sJbUVycRWTaYtRoqf+BMApqYFDvcb/
	7Py3hR5nPTxShhwmSC3QhaVHLMsEfJaF+HXSjNsL6t1iz9cTpN06Ev8q1ytiDJr7yVP9AENPzNI
	FLkLOc5HHx2HLj3bPyW9IyF6kLvG/MD719QMaOuMkRou+16EUc76LUatL8dEfDQxy3JIp4ckRl6
	p8E/wUcDjMuQsO9h56vtk4JjO4wTmSCMfx8CarRvEqIP3tOKwqlu++LK5A=
X-Received: by 2002:a05:6830:2692:b0:7e9:c6fd:c36e with SMTP id 46e09a7af769-7ec097b3ac9mr5781922a34.3.1784041483243;
        Tue, 14 Jul 2026 08:04:43 -0700 (PDT)
Received: from 3155-XPS.case.edu (casewireless18.CWRU.Edu. [129.22.1.27])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7ebcae206e2sm15301403a34.2.2026.07.14.08.04.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 08:04:42 -0700 (PDT)
From: bogdan.nicolae@gmail.com
To: Arend van Spriel <arend.vanspriel@broadcom.com>
Cc: linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org,
	Bogdan Nicolae <bogdan.nicolae@acm.org>
Subject: [PATCH] wifi: brcmfmac: cyw: clean up PMKID and cookie code
Date: Tue, 14 Jul 2026 10:04:23 -0500
Message-ID: <20260714150423.53960-1-bogdan.nicolae@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bogdan Nicolae <bogdan.nicolae@acm.org>

Avoid setting packet_id to cookie, which is always 0. Instead, use an
increasing atomic counter. Avoids mismatches of completion events later
in brcmf_notify_mgmt_tx_status, where packet_id != vif->mgmt_tx_id is
checked.

Also, zero out auth_status on initialization. Otherwise, garbage will
leak from the stack to the firmware (when ssid is less than 32 bytes
and/or when params->pmkid is set). Then, pass the params->pmkid to the
firmware (without it, the firmware caches a garbage PMKID on successful
authentication and denies a subsequent association request that includes
the PMKID).

Signed-off-by: Bogdan Nicolae <bogdan.nicolae@acm.org>
---
 .../net/wireless/broadcom/brcm80211/brcmfmac/cyw/core.c   | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cyw/core.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cyw/core.c
index ce09d44fa..99f8c5bef 100644
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
@@ -123,7 +125,7 @@ int brcmf_cyw_mgmt_tx(struct wiphy *wiphy, struct wireless_dev *wdev,
 	if (!ieee80211_is_auth(mgmt->frame_control))
 		return brcmf_cfg80211_mgmt_tx(wiphy, wdev, params, cookie);
 
-	*cookie = 0;
+	*cookie = atomic_inc_return(&brcmf_cyw_mgmt_tx_id);
 	vif = container_of(wdev, struct brcmf_cfg80211_vif, wdev);
 
 	reinit_completion(&vif->mgmt_tx);
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

