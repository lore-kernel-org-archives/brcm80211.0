Received: from mail-vs1-f97.google.com (mail-vs1-f97.google.com [209.85.217.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EF44200110
	for <brcm80211@lists.linux.dev>; Tue, 28 Jul 2026 14:46:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785249973; cv=none; b=YPTkN6Mw6XgdVXQcsYpPvVswJNGaARVCaotBHfgdxfmMAiJj2DsPmLUHseLBJROSQq1U5hEPFscqWs1CfELJU0Y5QSWBzTPbFf5I9oY3JFw5muBp4wwJtv1claR6TgfMS8xnbwIetW/6Bel6iDQnsSF8a5Uxu30pQuU6h1ogPGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785249973; c=relaxed/simple;
	bh=jjqnCmv9oDXIrOl1pvHuk1P9Bb5JrIDTD1Fg/jxkKco=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BgcdgiBM3M9THpO0AxJsUipuFSvxwVu/pmjVftfusMxeCEANwsxxcy092vPGF4z7P+VYKJ+fQbIUYnFtWdVRnsX/jumtkUP0HIK+UT+wI0+42FZ+CXMTfnwDop/gE2zKM1W1DAEAXO9oDztFxTW8wesD3i/bH0VQXwSvWDj0to0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=eYEwhhr2; arc=none smtp.client-ip=209.85.217.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="eYEwhhr2"
Received: by mail-vs1-f97.google.com with SMTP id ada2fe7eead31-74d55dac06dso960713137.1
        for <brcm80211@lists.linux.dev>; Tue, 28 Jul 2026 07:46:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785249971; x=1785854771;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BTM33pxTJFajE0VLj8hw6g6BzNrwABVCyMkeqZSn7Oc=;
        b=aCip543QZHs2xW9CYPQAs5ALJS2OhcMNKyEjCdyL9bFObBAewKcomfO12VzgGs8ogq
         oi2R2WVgheCkbYeCvsOouzGc3Uh3rdkT2d7r/bXW3oIlv/VIk2Bdzuq29HuFgtB81StP
         IUW1QZgY3ebDBeDK83yeu9Z0RbPz7Iz+6He8TS4zxxU+9P+x9AMocjXJp+yrz56C/Q6H
         7ztpDFpoocSnzrkJh1qgXM40unV/cVtB8gRAgp8hcWGaL8fHpGEOk0OGS8hR9fEMDQ2J
         hnUnb7kYHES/d3C2VPIW7tQFGco8kq42Z9Lp6Nm7uXZpdD1+3uYPMFXdkR4e/q234urL
         yrAw==
X-Forwarded-Encrypted: i=1; AHgh+Rrw6/ne9l7oCfLB7R/fULuDe59sxLKFP1osaQgFGPuKaC2NCC6z1asHs2J7dIBFgnOZ5Nqi1I/31Io=@lists.linux.dev
X-Gm-Message-State: AOJu0YyjGZ1am6Edpp4jTo0clh8qjrFZL06O5BUFlrmnuyml/6kr33Fn
	+vfdnBzLx/FdWB5QQSbjIA/LhnKCWsMRK1y1vMd3nZCvuf2WUuMWsAH8TV1YF2vpoNWYP4EwQB/
	Prz30WvAaiRNaNGiOQkxWzgvXd6NIIm908EYK21t1pFL1uXlAwqTg3zZGTPkbwtc3uTJWZmEuAy
	9IYi0xNw1bIpZwicce8cQYsaDt3hV2c32AY/DDB/ai+tpuxh84t/yNGXG35cyVGhow78aeWj46m
	bguPC+NJnkOoo2JPcES/Q==
X-Gm-Gg: AR+sD13YABhTVHnnUIoEpYtjST8C5a8WYuySxCzdb+JDoebuJmE0M8OfB1CkTxxWIzq
	p1fXgWfv96bWMLHOZ4Qzd82WUpnkAgSbaO6bxcpVQyaDuCyG9m6K5TbNnnAu4SAlktXb4dScEqt
	SckIpBtk5jYUMicHNfyCOhh1qmS9fvTprH2F9mw4USCgeqS9raqQmm/x7qBYoyy+KJJzsWbAnOd
	s1tR1AmV0s7tz5+nyrKESiJmSjhNBnsDA2XRv8Dxe7m1NdkJhKBw3jD/suruWYMZ9CfvPLZT38Y
	W9Q0MSAb4D2KzvcR9K9z7PmgmSVBVpXL7Yc4iJ6coejP3eBIWiBsXqbSwDd68sCI/yWCAJCgQfW
	GItQcGuNLS2FJkuSLoiWTnVu/zc4efYmiRCeXcC21WGeY8GN9f6+QJdoiWri5/CBQ6UnNU3xmCq
	q6IUOtDCFZrhNkd4waPVmP4q2AlDFnMngG01JHfJ8=
X-Received: by 2002:a05:6102:3e86:b0:738:8022:d74c with SMTP id ada2fe7eead31-754a19b7917mr1278205137.15.1785249969201;
        Tue, 28 Jul 2026 07:46:09 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-73.dlp.protect.broadcom.com. [144.49.247.73])
        by smtp-relay.gmail.com with ESMTPS id ada2fe7eead31-750362f00dcsm858508137.20.2026.07.28.07.46.08
        for <brcm80211@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 28 Jul 2026 07:46:09 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e62e3459fso424684985a.0
        for <brcm80211@lists.linux.dev>; Tue, 28 Jul 2026 07:46:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1785249968; x=1785854768; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BTM33pxTJFajE0VLj8hw6g6BzNrwABVCyMkeqZSn7Oc=;
        b=eYEwhhr2isL8p/zAmanXDrYcr7JPrIR8c2wNoahwSXzyXnfZ2YfSpR4Xwl8acNcIc0
         xKF5pm2V0FwxIRVH6I5WLdKt+KLet+ET7SmlCPz9K63fK16+H9Qmnb7st1jmMuWEOSVF
         tGqgRMtCsHxSS19o29EkWguoj5gu7L3a2ztJk=
X-Forwarded-Encrypted: i=1; AHgh+RoBaxrGN2nlwBmY8TLSMo12gVHMHscALJEOCf12gfWgC8Lu3wJSyp/l/EA+IG8bu/KQCOQrqRMSJ2o=@lists.linux.dev
X-Received: by 2002:a05:620a:2604:b0:92e:4927:1ff9 with SMTP id af79cd13be357-9330271f9bbmr276841885a.40.1785249968496;
        Tue, 28 Jul 2026 07:46:08 -0700 (PDT)
X-Received: by 2002:a05:620a:2604:b0:92e:4927:1ff9 with SMTP id af79cd13be357-9330271f9bbmr276836385a.40.1785249967909;
        Tue, 28 Jul 2026 07:46:07 -0700 (PDT)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-932de519154sm878659685a.5.2026.07.28.07.46.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 07:46:07 -0700 (PDT)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	Arend van Spriel <arend.vanspriel@broadcom.com>
Subject: [PATCH -next v2 06/12] wifi: mwifiex: use pre-assigned cookie for remain_on_channel and mgmt_tx
Date: Tue, 28 Jul 2026 16:45:43 +0200
Message-ID: <20260728144549.2207061-7-arend.vanspriel@broadcom.com>
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

Stop generating cookies via get_random_u32() in
mwifiex_cfg80211_remain_on_channel() and mwifiex_cfg80211_mgmt_tx().
Use the pre-assigned cookie from cfg80211 instead.

Assisted-by: Claude:claude-sonnet-4-6
Signed-off-by: Arend van Spriel <arend.vanspriel@broadcom.com>
---
 drivers/net/wireless/marvell/mwifiex/cfg80211.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/net/wireless/marvell/mwifiex/cfg80211.c b/drivers/net/wireless/marvell/mwifiex/cfg80211.c
index 99d96088e364..7f446a22a370 100644
--- a/drivers/net/wireless/marvell/mwifiex/cfg80211.c
+++ b/drivers/net/wireless/marvell/mwifiex/cfg80211.c
@@ -259,7 +259,6 @@ mwifiex_cfg80211_mgmt_tx(struct wiphy *wiphy, struct wireless_dev *wdev,
 	tx_info->pkt_len = pkt_len;
 
 	mwifiex_form_mgmt_frame(skb, buf, len);
-	*cookie = get_random_u32() | 1;
 
 	if (ieee80211_is_action(mgmt->frame_control))
 		skb = mwifiex_clone_skb_for_tx_status(priv,
@@ -326,7 +325,6 @@ mwifiex_cfg80211_remain_on_channel(struct wiphy *wiphy,
 					 duration);
 
 	if (!ret) {
-		*cookie = get_random_u32() | 1;
 		priv->roc_cfg.cookie = *cookie;
 		priv->roc_cfg.chan = *chan;
 
-- 
2.54.0

