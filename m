Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB2C6242D7B
	for <brcm80211@lists.linux.dev>; Sat, 25 Jul 2026 01:47:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784944060; cv=none; b=Q9v4HSOfWnDFa/EjLHRuikYSOXCBl29lXdo8DirTIKd+BMAQxAjtsLp/ziUawB8hVueJmMtjqFFnikh2ISRFRenWWdQ37uYe36bNN80PdPjx6VaKCMmJVIJ5low0jvha3LzP+rBAh9dGWgPe4MJEJQkKngebxXyMmAhanshNmzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784944060; c=relaxed/simple;
	bh=6xKAh6E4WLp9QISyYYX1OVDeYsMFNbN68FcKZgcDOVU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hjeagcJTwtN0XzxyEaF+NOUyyWEXahn61OchX8pgrUD4a48pKQQyjACvPtB/yHkM+jul4fOfF4Iz5UuuEEtimacpZ53Oxg1FeQo98SjSWvt+2nfUfBZQqwrkhr3HbfX507/o8+NNxk5ED9NKkfp3ZUD1640N2JLz0turp1X6egk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gMhy0TDf; arc=none smtp.client-ip=209.85.210.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gMhy0TDf"
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-7e9ec26b85dso115640a34.2
        for <brcm80211@lists.linux.dev>; Fri, 24 Jul 2026 18:47:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784944057; x=1785548857; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8nxam113cCiGb2Bxb3oppPtZB3TkRP3OfdaVNSdcmXQ=;
        b=gMhy0TDfQeH1RVC+T2lLIngVaN4RZEZh4ldE4N6f2XxauxZ/u85lZ+DJfL3z53lzD5
         yWLf8jqYFoaiPrd/KzxXrgsQH2669762BEYpe44t3WYzd5zsL0MqfCdIsMu0p9stz+Mo
         W497QobfRkFrvjxKsxdRqJnxkep5AhyoA/UWNVD+OYYq2vgTaNxDCRbP9qJAnmEAsPyh
         tATjpPGSyxIjo8TEgBQnbeUmk45F2iYuKvTyWjAIOtkcIaKg8Q2O4vfExCLkMwVH/U3C
         i0+NP+HM5RXQL0jYteZar0iO6GVdf+MEoXTTdf78/pB/nQ9aNr1k0iUicjlApc/LJr7R
         YvlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784944057; x=1785548857;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8nxam113cCiGb2Bxb3oppPtZB3TkRP3OfdaVNSdcmXQ=;
        b=WE2oh0WIrz1t8VyJSP9F1ACrl60W0r3pJk0Joa8U97Yz6BrS5RF9sWNp/6eK64XFBy
         wsamMQHQg5BLZkZLU+B7rdtNBUsrDezZL0AIEIVOhGvr6ywYUDCqexwTv6BQ4lGKzcUV
         IOC7/oRv+1rtatgqRiRufkkoZScKzs3Ht9uyX9qLZIOukXRy+vIxWUe72xGXQmQ5L8ru
         yPCfWX7wIJGpweDegH3cP/Lhd0Q9/GF0nqlG9S9NEXxNP4j+mKqxbDLcyw3omp6TGiN5
         HA6tApoJyGP55oiKtY9+oFn4vxNy/ATW4cURrncgv063tulHh5YqTjX1aX29sZkhuGNx
         l/cg==
X-Forwarded-Encrypted: i=1; AHgh+RpR2sRxkIDXDhMA3ZY44CwrKiJBq1f+OnQjbV+3BwMveUaczywFKPr5czjVOotOvBbk2llYuY738oU=@lists.linux.dev
X-Gm-Message-State: AOJu0YzmNKZvL5WFR78P39fty3a+hd9+3B4TJLuAwDVQdu4+IMRStUcN
	4k/4SbYB6ab7cikDMoyCWwhjj4N+KMJI6vWZ6un1pJixzhPnbPG3v3QKh3HAOODk
X-Gm-Gg: AR+sD13ZQKAWjKnQiwJWJCwG1i05Kbzvw3AbyqRSfdJbyDcNiRTy5Wk5PzSo3ZobL5N
	IbILs+qqnB3ZCRoYUnDK+4CmCkhKQ8V7mKkcwfejjCiR7RsM1T+zdMXb+V3p8jpx/SWLu205Lpj
	XDwN8mpsTkBSMZSxVAx8aHTjgJTTU1vr234G6DxYwO2CQ8eeVwsqC4gJxJLCBl9iEaWPmuBwS34
	AYBdVOz31NSK6HIP/nQ8ki42UlvU41RH9RzTSKDCcY1wYucHl+36B+sYG7k2J74uGnOfi0yaGs4
	DVg+PJwqHCnHXNxG33pTjGFarUPKhxHwX3XTRyirykRBYHscCjfY9h+LKsjGEzSG0BSgRUQJ7Fi
	J22V/6sRXx2k+94wpgEUY+5NS5xAup8OV2OCImQV2lYoEUbKY6zVczx+/e1CjZFSa23NyQwa2FO
	yMbywQ+w9Xjsichm9EKqavC0NBMOFkvab6UX68j5Te5dL60sOCOCPih8+5l1pZS2qSNoQvW7P7k
	HiH
X-Received: by 2002:a05:6830:902:b0:7dc:d6b1:48b7 with SMTP id 46e09a7af769-7ee78c1ce7fmr412403a34.1.1784944057377;
        Fri, 24 Jul 2026 18:47:37 -0700 (PDT)
Received: from antares ([149.88.25.215])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7ee2a03d30asm7348058a34.18.2026.07.24.18.47.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 18:47:36 -0700 (PDT)
From: Bogdan Nicolae <bogdan.nicolae@gmail.com>
To: Arend van Spriel <arend.vanspriel@broadcom.com>
Cc: linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org,
	Bogdan Nicolae <bogdan.nicolae@gmail.com>
Subject: [PATCH v2] wifi: brcmfmac: cyw: set a unique cookie for mgmt tx
Date: Fri, 24 Jul 2026 20:44:11 -0500
Message-ID: <20260725014411.170340-1-bogdan.nicolae@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Set cookie using an increasing atomic counter. Avoids mismatches of completion
events later in brcmf_notify_mgmt_tx_status, where packet_id != vif->mgmt_tx_id
is checked.

Signed-off-by: Bogdan Nicolae <bogdan.nicolae@gmail.com>
---
v2: split into separate patch and set cookie to atomic counter instead
of packet_id directly.

 drivers/net/wireless/broadcom/brcm80211/brcmfmac/cyw/core.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cyw/core.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cyw/core.c
index 2c59b5e57..ab4ff0cd6 100644
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
-- 
2.55.0
