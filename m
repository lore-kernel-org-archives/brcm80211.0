Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C67881B0F19
	for <brcm80211@lists.linux.dev>; Fri, 20 Feb 2026 02:27:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771554479; cv=none; b=GkQjz3woZaxOGfrxZW+kX6/slX9TEBkDVXy7EoecBCnKQOuXEJg3jTo4ZiO9w0cRa4YV5BDEZ01BjfqyCVI/LwDi/M0xRmAWuJL9r5CgxBmgCngF+cXQTJtKzvDwx9HLeaDO9OSURqIFcXZuu/o1rNscpGQxsA6DQrveVqijqvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771554479; c=relaxed/simple;
	bh=z0S+zYxCh5ZAGTpi8o0OuRy1X+bKoH18PQz5rt7kZjQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=g8VKgOIczFXVPrzeJcIN3DZoJDGPOFLXt+dKXD6QtQxH9HdbOVTc5wSrKK5xD1/FMXc66+4YXcg5ZYtK5vWQERH1Anfe03kwC1lgigijtN+00P5vWAkQxn4Zx/cReaG9NonozSbtBuWkP89fBtQCoqWkSJ9ds+XA/zylqYruJ6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hVbwBgxd; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hVbwBgxd"
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-797d36fdb96so33773817b3.1
        for <brcm80211@lists.linux.dev>; Thu, 19 Feb 2026 18:27:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771554477; x=1772159277; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jaxTrnZCeT1cAUjaI26ZzZAsxZfpYi5XVIt7dxhlksQ=;
        b=hVbwBgxd0MeSyeCrIFLSgUxpjWPzPYnidqwaiyI0J7D1IyG0Icn+YsWeMbTy5vlFqt
         oqoAGhw2H3I0vG0LNJGwhyUf2cvzaCo3W6hJf3uUUhJJM6OmnoF5RICy63lnS7Q4ZTL2
         yvJjdXdQUt0gV/p+mQOagu6nM2sVfPWb6Vczm7kCI6EhrKnFa04DGz/XBZTbLe01b8XH
         d6fRJyWHvQpz52VaOBZ4p9zg129NVuC5lqqzyAUknnn9VuIJan1faqlwkY/BHv3qYPPk
         y8HWq5Av9SGHDrgPkX0iXirgkPWYWEOEBf5kcuoC0AmgeRgPhoYtMN1HAm3CbMW5R5KY
         4mfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771554477; x=1772159277;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jaxTrnZCeT1cAUjaI26ZzZAsxZfpYi5XVIt7dxhlksQ=;
        b=XHxG9Su6cXC3AP6zCgPVR0DDQL0Hxdi8qLz7OQocfUYIwyYPji6w9q/xr60NNA4EXc
         MN6gknJw0F3wEfYAGhGB/jjrrI6ZFREnyrsoJtmByj+4HyetnVcWANZCN8AEwW4ePxGn
         roHa5qjYOaVL3EUo0OebGUWoMq1GAA3McXd1rc3mDwpecXmRS24/gGDd5ml75LdeRtQ5
         yPl/p7MukPKBvfYJXQ027wvRmxJSxWOHSCzMhBECdRaUv5ZvKn3fKwoO4J1OngLlfcL3
         Yr6CCK/UzfwUSy5wvtyn8mSoLUg78qa1p7lF1Rxsavt2Z2kTskJojDTPvsT6Q9KylfFI
         EZ7g==
X-Forwarded-Encrypted: i=1; AJvYcCV84bE7caQkpboV9IjExtSBQ+SZgOzrLFjqfFyYaWV8WyKj1da86WEe+hwMg0Uws+4sRMp5Y92gDWo=@lists.linux.dev
X-Gm-Message-State: AOJu0YyaFK4W7UCR7XpQXQ8FcpzHAj/RlTJJocC61dseIKM5n4KVwucK
	6DBXm05OclpPB+nneiiQ7HfP8GWewebeznZm88D/Ka4zCcmmdFU6Cdoi
X-Gm-Gg: AZuq6aIHWq5drFhcY4O2XPDQCzZEZ3EZI3G8Oe7MxnRiuqviBtcXOGPXRv8EUuab2NL
	tL8K+KNpGh1v6dah4VZkc/nodbVbfXM1I6uzEncFQHz6hGPwKcru5lYWgJYOV0Ym7fHey5afyA+
	AIMBDHj8cBYyMmwAbQQxzSqXy9zk9qmqYETOIsE5a3WQe1jBn7VQ09sHQYzL0HKJPWspEX1p/nX
	IAnSUO1k0M3qRyKffK0kHkF9eh7KoSgdxyRHzbvaTrMuLOdvoVo78+yXWj3yUbmWzSSI4Nc8lZ2
	JuWyhLbMdIJrmzRV3jFzDw55DKtoDpwuW6eod6SElp+cUVNVhlZ/ByiQbuZZvanSh+D8mFl+prD
	K0+1t3fZYs5nSRAQvGAMx5uEbbbEu1P2B8SrtRENtbqFqVZwo/3xYGz2CqkcEb9FOuhP1
X-Received: by 2002:a05:690c:f09:b0:794:c283:5fb8 with SMTP id 00721157ae682-79807d19561mr29435477b3.25.1771554477482;
        Thu, 19 Feb 2026 18:27:57 -0800 (PST)
Received: from ryzen ([2601:644:8000:56f5::8bd])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7966c257ed5sm137116877b3.45.2026.02.19.18.27.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Feb 2026 18:27:57 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: Arend van Spriel <arend.vanspriel@broadcom.com>,
	brcm80211@lists.linux.dev (open list:BROADCOM BRCM80211 IEEE802.11 WIRELESS DRIVERS),
	brcm80211-dev-list.pdl@broadcom.com (open list:BROADCOM BRCM80211 IEEE802.11 WIRELESS DRIVERS),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH wireless-next] wifi: brcmfmac: of: defer probe for MAC address
Date: Thu, 19 Feb 2026 18:27:39 -0800
Message-ID: <20260220022739.41755-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

of_get_mac_address can return EPROBE_DEFER if the specific nvmem driver
has not been loaded yet.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/net/wireless/broadcom/brcm80211/brcmfmac/of.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/of.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/of.c
index 1681ad00f82e..03efae36a0b2 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/of.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/of.c
@@ -128,7 +128,9 @@ int brcmf_of_probe(struct device *dev, enum brcmf_bus_type bus_type,
 	if (err)
 		brcmf_err("failed to get OF country code map (err=%d)\n", err);

-	of_get_mac_address(np, settings->mac);
+	err = of_get_mac_address(np, settings->mac);
+	if (err == -EPROBE_DEFER)
+		return err;

 	if (bus_type != BRCMF_BUSTYPE_SDIO)
 		return 0;
--
2.53.0

