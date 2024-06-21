Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F2CB16F26B
	for <brcm80211@lists.linux.dev>; Fri, 21 Jun 2024 22:56:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719010564; cv=none; b=ZU89ZYv1GXpBIAXuWoMLkT+19TSzP+Eo5z6n0o0UM9iXjg4bIz8YFw1E6o9HSuntprh28oopnTUEDy35u+OFkxQDqe9MqA5Yeem0Ybg87GkDjrTw6Qevsk9TZ4XjDRGTLfHWxt0clpIeuHtT0cIbJbl/lOY1+SsaDKStQh5tkOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719010564; c=relaxed/simple;
	bh=4oUdsvqCDrLiUkMVo03wVv5uUKw1KazsqU/cnfG6uhs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pf2TtUfCbDLP7L9B/svA3sXjosW0iDV5DSND+omvP8D6ZP8g4W6XIUAebTxg9hsN7M5FOIh8ejlrU85IA35MTyAwJ6bpyPgEME3laWaZc+rJYGJVI7vDAICSgACmlLxVEPTGUpkEpe2N4Z2gVEOxWlYasXNpkUuUgYJ8tiiHduU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O1jD+Eb0; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O1jD+Eb0"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-57d251b5fccso2033835a12.0
        for <brcm80211@lists.linux.dev>; Fri, 21 Jun 2024 15:56:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719010562; x=1719615362; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=o6JyC8iY2Muk9y3RK0oBca3B3yHY25hFFfJVNqJVifY=;
        b=O1jD+Eb07QktcB+S8f/o77GeyQwD/r3QnWqaOcRtV+Pf3BFSnzkKeNyxGLmU4HytCh
         H+bNHyLyYiJzBfmPV/gtT1i2zpfyAsBdztcQZmCZyM1qaLsivJ566Xl/cBa+ZrO+4z+y
         wlevz0nOjMXNrmGBk2f2VM8j/RFGcs+PnsRyGP01SW8jkd2VkJg4c4b3fBnp5OdVcZKM
         +8qFmjYDSAteMqz5JOuBYd9RqnCbAXXpvA8BMBO0sA/vt/gvsJa/qLLEaWOAY6PQSvkz
         SZvAdg9jpWZ/fZL7L4e6FvWZdjfjTtG1YKBiliq9zOsD8v5Nc0uvo2mss1taxQXGpTHP
         leKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719010562; x=1719615362;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o6JyC8iY2Muk9y3RK0oBca3B3yHY25hFFfJVNqJVifY=;
        b=sba/WlxhlTGk5Zh33QwntXv7qxd1beco91X1KtfRDbF1+CQygP9svUlzRP8EXeDv1K
         X7ANSg367McJsKaBtJL01gt3RlpjgFmrfxtWt09+qLHxxLh4tj5TYE3ZyLZ/vtaXTaaa
         dFKlZ3UPAQCfVi+xQ3dlhQeh6Wh3KEsOZ2JG9n5JxKNL/cDzESu9VyK88yOVucSixsmv
         xE5C+EzPy1UW+8pNxL5ayXVkoFt8G/9qOKPBRc2NUIjFRcL66JrTJWmhlmEbI0+6FVLr
         2g6z8snn7KDmKShl0kdueWbj11TLDoke6iJ+wNOseyM3i1mrwlDm9fVWtNVhIm9X8xem
         jxAA==
X-Forwarded-Encrypted: i=1; AJvYcCWV4yegjf3SR7RH5eMeWvPrUv+xzztMCdRa5e9FJLLnorQP17HvDtJY42yfAZLrhh77DIV9Zx6xKtoJSfePwxNCpggcXLe1i9Lh
X-Gm-Message-State: AOJu0YxPayiXer/nH+5VbNqTRCuX2EDR9Yari5X1Vq4ryVClKeLzAyeo
	22Baguh390V4Ntswwdkq9cMCRv0gUmYt91vMSsMJOHTCXgGEHX7ZnRGA
X-Google-Smtp-Source: AGHT+IGMzl+xBQUL7dOvE+TEcJ/gGUJX9+zMX68SSdTV8Tvv2glRsSTXnvBMZenX9Rr13Y/oi/SAXA==
X-Received: by 2002:a50:d6d7:0:b0:57c:5f74:d8ff with SMTP id 4fb4d7f45d1cf-57d07e750c8mr5784439a12.21.1719010561093;
        Fri, 21 Jun 2024 15:56:01 -0700 (PDT)
Received: from U4.lan ([2a02:810b:f40:4600:aed6:1d20:313e:7dc1])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57d3042d421sm1537795a12.42.2024.06.21.15.56.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jun 2024 15:56:00 -0700 (PDT)
From: Alex Bee <knaerzche@gmail.com>
To: Arend van Spriel <arend.vanspriel@broadcom.com>,
	Kalle Valo <kvalo@kernel.org>,
	linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org
Cc: Alex Bee <knaerzche@gmail.com>
Subject: [PATCH] wifi: brcmfmac: of: Support interrupts-extended
Date: Sat, 22 Jun 2024 00:55:58 +0200
Message-ID: <20240621225558.280462-1-knaerzche@gmail.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This "new" version of defining external interrupts is around for a very
long time now and supported and preferred by irq_of_parse_and_map
respectively of_irq_parse_one.

Support it in brcmfmac as well by checking if either "interrupts" or
"interrupts-extended" property exists as indication if irq_of_parse_and_map
should be called.

Signed-off-by: Alex Bee <knaerzche@gmail.com>
---
 drivers/net/wireless/broadcom/brcm80211/brcmfmac/of.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/of.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/of.c
index e406e11481a6..6cdc941552e3 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/of.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/of.c
@@ -129,7 +129,8 @@ void brcmf_of_probe(struct device *dev, enum brcmf_bus_type bus_type,
 		sdio->drive_strength = val;
 
 	/* make sure there are interrupts defined in the node */
-	if (!of_property_present(np, "interrupts"))
+	if (!of_property_present(np, "interrupts") &&
+	    !of_property_present(np, "interrupts-extended"))
 		return;
 
 	irq = irq_of_parse_and_map(np, 0);
-- 
2.45.2

