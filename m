Received: from mail-ot1-f100.google.com (mail-ot1-f100.google.com [209.85.210.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16A4245038
	for <brcm80211@lists.linux.dev>; Sat, 28 Mar 2026 14:01:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774706493; cv=none; b=csKE7ZCcomTOLYyvfJLiMgGQGvhR3FfT0oiWCyaG3PqK1BY91j1ZZTgKxbr6d1+0HYvB9eT59CXaK47MWB66AE7kv6OhkCXpkvC9v+UCNIBFGldita2BNA4lYKSfE7hNLyxBzFeqxjEjEtHYLuERLEZoOruI3eueCdKfHRe3wUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774706493; c=relaxed/simple;
	bh=v27CgWKJduciAD30Cwhnf+g92Mqz1HiBHL3YqncTGg8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fy9f6pBBlJ2Mqwz2+ouHBCRLuNKJJdGjDOXderAJT9gTith8b6HIFYZaaX1sk3e0Dhmxm8uReYogI9/R2X8Bln9NRfCbg4Xaa52t47ohWXmyrdLFBqMbr690VYphvK2lT709GapP1guTzkc9PURB77x5KizIAVxkayASErgA35g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=aPioyamN; arc=none smtp.client-ip=209.85.210.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="aPioyamN"
Received: by mail-ot1-f100.google.com with SMTP id 46e09a7af769-7d1872504cbso2923721a34.0
        for <brcm80211@lists.linux.dev>; Sat, 28 Mar 2026 07:01:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774706491; x=1775311291;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=54xQVob9wdFV/Y49RL8c+XQpBeMY6onRtC3s2HHzq5o=;
        b=sCb+2x92Ham842lkxDbQ79feidvkq1ezltmp246t+GG/ATYxw6XHy6tGvEwjOCm9ZB
         DJaUYfJ4rgRrXN9vtFE97bWRZW4K+pVGaXC7Xj7CcOPc2VX4dwUM8ek+A0/Lm0Xb2D7h
         e+W2cvFbo3WpvchLL3dVmj16sD9+tH9z7LGYKQ81g44EYaXKKq74KiVSVzaQeKWLfFie
         i3Exz+aeZTRSBPfIgM3ndaLS2eC4hJiKaIqrSU6muDLhZLlvufVX/QxoT86ti46OLgHx
         NpXVlWhVE/vlmvIVldLoXVsUjj3IkqO5XcACR6RQ/B0JtdnwWJFCvjb2iBPEA20EMKCf
         yKnw==
X-Forwarded-Encrypted: i=1; AJvYcCXvMB07AJx1kf9QJstHm08Mqk+MC9qKeeNGVChgub1do4uY8h28ZKiOyjfj2xM3IOBAkHYpQV/SKJg=@lists.linux.dev
X-Gm-Message-State: AOJu0YzYSInTyzKaNb1HJBQIZCC2xi+T65b+2VtUvc7ij0JKd/23b1wX
	9C1AQwD9azXO4IJATrG/7vwq6znRM7CyXOGam/uBAIaxd8PN8LMQeHMIlOyDHAV1Pa1FaYIveSh
	e2F6f2s1kxyfsCpDDaKNJBDWfjn88PCbAk5Tk8D3VNY2nu3m/cupnzGwPuzoSchYRn7+goW4aAJ
	Yu8/oQnqB+Dt5rh5hrA5YhgZ+/jQUwN9RR5+PM56jMdcHtL0Wf3+D8kJ/65jyzOnCgrFeVqiUhq
	AtZMCornw4mYv1Vfns1QQ==
X-Gm-Gg: ATEYQzxYkozSi7s/lK3eREqH0CcS9sgd35Htyv8gOFxldjPvbmEvuzfHzgbUuu+QHLU
	suKyuazVwjO1FSqxn4GGaZ5dgK0zEhAxnFb6j3J+uBs0tHwl0NUY2WGuzsH9qcROOqYqQuvRI1P
	88IH/+Rjjql67TBRAjaJu9ixC2cRjKxp7NiDjqkGWEcuT8wfsBFPcBa66yeDs5S88ftY2dfcZIF
	qS684JbjZdpIvqhs343wu2Gv9MRCujSRExR6pfiBRgB+/4BrOaM6qrgT1oVBglVc7i+/LXAE9xg
	4hwoLcAjFLHWabQA1P2MpwIfQQtTzxEbpqJAIw3RW3KdKmXOMm9V3nSEoZcWL/QgjDsQbvgdAXV
	99E4CxzN9nHsbQG0bkCWOs1usJ7PZjSDLhaaIigJrjer75aagbuxDfKws+0DtYFL9WLEF4plNDP
	XxEseim0R5H6y7h7oobZ1sg2Oh9IF6PJNhY/oiqImFcCsnLhd/S3XBOWnXEkLD
X-Received: by 2002:a9d:7dc5:0:b0:7d7:45b7:ed8a with SMTP id 46e09a7af769-7d9ee135024mr3741710a34.5.1774706490863;
        Sat, 28 Mar 2026 07:01:30 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-25.dlp.protect.broadcom.com. [144.49.247.25])
        by smtp-relay.gmail.com with ESMTPS id 46e09a7af769-7da0a7b57c5sm535623a34.5.2026.03.28.07.01.29
        for <brcm80211@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 28 Mar 2026 07:01:30 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2bda35eab74so2118250eec.0
        for <brcm80211@lists.linux.dev>; Sat, 28 Mar 2026 07:01:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1774706488; x=1775311288; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=54xQVob9wdFV/Y49RL8c+XQpBeMY6onRtC3s2HHzq5o=;
        b=aPioyamNxeU42mrmH41mn5jhnf3DgsmZgrREW0JzOC4CY0sF38jEr51e3dO4V0wOnJ
         IybW2KI3qhhBGjvCwTcZZWZz5kEV4kC+04R1gbwZh0epgNPnC8jViPnbe0GlgSeqEoJC
         y/W+kgu2LGuNl/royuF2AH7UlGFo4MRDSIhlI=
X-Forwarded-Encrypted: i=1; AJvYcCWeRwWYk75i75/NwBB3bB10bmN5fX2DxR2h/p0ZOeoY23q4rgFPuvAC72PfLjQ0XrRMi5toqMzskog=@lists.linux.dev
X-Received: by 2002:a05:693c:2c8d:b0:2be:b20a:9b69 with SMTP id 5a478bee46e88-2c17723bdb8mr4497401eec.12.1774706488085;
        Sat, 28 Mar 2026 07:01:28 -0700 (PDT)
X-Received: by 2002:a05:693c:2c8d:b0:2be:b20a:9b69 with SMTP id 5a478bee46e88-2c17723bdb8mr4497374eec.12.1774706487510;
        Sat, 28 Mar 2026 07:01:27 -0700 (PDT)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c3c3bd9894sm2135470eec.4.2026.03.28.07.01.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Mar 2026 07:01:26 -0700 (PDT)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Christian Hewitt <christianshewitt@gmail.com>,
	Arend van Spriel <arend.vanspriel@broadcom.com>
Subject: [PATCH -next] wifi: brcmfmac: silence warning for non-existent, optional firmware
Date: Sat, 28 Mar 2026 15:01:21 +0100
Message-ID: <20260328140121.2583606-1-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.45.4
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

From: Alexander Stein <alexander.stein@ew.tq-group.com>

The driver tries to load optional firmware files, specific to
the actual board compatible. These might not exist resulting in a warning
like this:
brcmfmac mmc2:0001:1: Direct firmware load for brcm/brcmfmac4373-sdio.tq,imx93-tqma9352-mba93xxla-mini.bin failed with error -2

Silence this by using firmware_request_nowait_nowarn() for all firmware
loads which use brcmf_fw_request_done_alt_path() as callback. This one
handles optional firmware files.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
Tested-by: Christian Hewitt <christianshewitt@gmail.com>
[arend: use nowarn api for optional firmware files]
Signed-off-by: Arend van Spriel <arend.vanspriel@broadcom.com>
---
 .../broadcom/brcm80211/brcmfmac/firmware.c    | 21 ++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/firmware.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/firmware.c
index 4bacd83db052..358abdb126a4 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/firmware.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/firmware.c
@@ -670,7 +670,12 @@ static int brcmf_fw_request_firmware(const struct firmware **fw,
 	}
 
 fallback:
-	return request_firmware(fw, cur->path, fwctx->dev);
+	if (cur->flags & BRCMF_FW_REQF_OPTIONAL) {
+		ret = firmware_request_nowarn(fw, cur->path, fwctx->dev);
+	} else {
+		ret = request_firmware(fw, cur->path, fwctx->dev);
+	}
+	return ret;
 }
 
 static void brcmf_fw_request_done(const struct firmware *fw, void *ctx)
@@ -714,9 +719,10 @@ static void brcmf_fw_request_done_alt_path(const struct firmware *fw, void *ctx)
 		if (!alt_path)
 			goto fallback;
 
-		ret = request_firmware_nowait(THIS_MODULE, true, alt_path,
-					      fwctx->dev, GFP_KERNEL, fwctx,
-					      brcmf_fw_request_done_alt_path);
+		ret = firmware_request_nowait_nowarn(THIS_MODULE,
+						     alt_path, fwctx->dev,
+						     GFP_KERNEL, fwctx,
+						     brcmf_fw_request_done_alt_path);
 		kfree(alt_path);
 
 		if (ret < 0)
@@ -779,9 +785,10 @@ int brcmf_fw_get_firmwares(struct device *dev, struct brcmf_fw_request *req,
 					    fwctx->req->board_types[0]);
 	if (alt_path) {
 		fwctx->board_index++;
-		ret = request_firmware_nowait(THIS_MODULE, true, alt_path,
-					      fwctx->dev, GFP_KERNEL, fwctx,
-					      brcmf_fw_request_done_alt_path);
+		ret = firmware_request_nowait_nowarn(THIS_MODULE,
+						     alt_path, fwctx->dev,
+						     GFP_KERNEL, fwctx,
+						     brcmf_fw_request_done_alt_path);
 		kfree(alt_path);
 	} else {
 		ret = request_firmware_nowait(THIS_MODULE, true, first->path,

base-commit: dbd94b9831bc52a1efb7ff3de841ffc3457428ce
-- 
2.45.4

