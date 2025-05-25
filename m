Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01BF93FD4
	for <brcm80211@lists.linux.dev>; Sun, 25 May 2025 13:16:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748178977; cv=none; b=RW2PMxmvt1YnQslYktr08OjdByZy/2ouFhVdgACaLJT+a09XRknKa0p45PaenwrFdwWX3wm15XLupU98zA9QWWTRLr62Fn1mkpssRBpd934K/KAItWa1Z+jV7Udxz7pmH01igXRtmTtEXrR/w2DebRBNp2MmA7268Ui755MgI/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748178977; c=relaxed/simple;
	bh=WGgTOIQpDUOpVmwuCbU89XAzo96eGWKm1D3I9EXO+bg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mzJGk9n4hllYC0kBlCi8nguGCB+EcD0Xn7yka20SruRaXce3ChamUUuMRjBD1R08Mu2rrAGZ8Lnwe+EShpumV5UcigAKq0NTX8dEgyYD8FVwkEP5Fvdn8bKZ/fppa036UAqWX95mXkF95mahImj7ZLBAKLIvGUwKSxJEn0XB/pU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=PCnTP3ZD; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="PCnTP3ZD"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-ad1f6aa2f84so283525066b.0
        for <brcm80211@lists.linux.dev>; Sun, 25 May 2025 06:16:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1748178974; x=1748783774; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6XvbA2aTkiZgmp2lOvkDpO+rhf2MkQsZDHy97frCbs8=;
        b=PCnTP3ZDe84iwmm+Xi4WFXUNTkR7v7TDg7dEZhOZE70IhBeL3fGUliYbdRyHO0Gesg
         87C9RqaTM7cwZewbdaFRtnfrwFCpkR+t/7zUGtrrxOvCqDDplR1LImaegRZyEQ37t72w
         yXYTjV6LEY8o/WDm/jkA2V1qd8wfHwAFwm0iKgElqNQNU95dZ0OxZ06l2RdorLtq2kRg
         YqAuLnzveklRbketyB/5z1R44CtLi0mXd+mRp2MWYmMPLo8Uvezy8qWvYguKqkfwNtWN
         FxYatcaY9ExYdwA8YR8LqHPSAfN04OSU213BlDX6kLySTy9DPX4gqUN0wmscf4rwp0JM
         cXXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748178974; x=1748783774;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6XvbA2aTkiZgmp2lOvkDpO+rhf2MkQsZDHy97frCbs8=;
        b=Kaam1NMxeGyiNcYHCS7a/E15urJtP1IAiKPIgHcY2+4eQ3ZVj+2AEMiod9AXetzUk/
         +sGkg3e/NgWbwpYeGBl0QtlztfslPYh0kKfEIMibc+4W5PqBo5n2eLAaN9wI4hOxsNWj
         ieW3tQ9GJ/wMgEGalwP/zYLXkY94s7FWiiATRAUeVRBZYGZDAudGNfsPi7gxqROYFAjF
         LbLsG9k1Xwt4O5+geIiMVuTbC7/J5FbJ6U/1lAikIXXi52gKcihegZrFb0PuMONLZjvm
         3cPsqTmodiC0dVAic4eOPR9XVXIEVCM8uol1KOofPs/ZUDNRArqyp1BPupLgTqRqdJrD
         3zFQ==
X-Gm-Message-State: AOJu0Ywz4zP8uvVEys4rY2U3+T/slbTu2vAWWSZnoar3eVixipg0dDdc
	eolcYlzEUP7BmcSVzLYyBj3aZie9yDZqIxItzl5tVQJNwW7zGaRfFeOp
X-Gm-Gg: ASbGncvUY/29NXu3CIuGVV3cVG2A1ejTffihFL0KDVyU86ZUaKJ9CxCnuAXy8DILqZW
	9B8QV35Hk/ni7/H5VboKM+0DGIsuGMM4NDI07qxZzMb7qFOIO6uBUmxLXAxmht3cGGHTda4xpjJ
	YQamVTIPizbty9E2gJ5po39zHec/BQA7oI+h7EG3gv4DPJZa8RVtg/6MFNQ/u5ojWRyRigB1QML
	gkYrUVlJ2BNj4T/s/BeLUfhD5hzTBpTSnxAAbSZH5hm3wpa2Nz1yjZa7hx/4G0fuhZ0TFh2MvsC
	DWLvUJ+6+Y+Zblxm0VdLT7I/WazZtpGjsb4XKjstafQc1dSGwPDCVtx0g1oy4tAVYEe0c8pJeUp
	OixpjNf9ekXSStI+lwn6218NlB1YtIeNFUhQIHznfO0n75cwtnjVTblLyswidD+YEelQnoif+Uq
	+Hmmj9fjC1RrafJXPuY5M=
X-Google-Smtp-Source: AGHT+IE793OXyd5Yjyb+Udvp+U0BqyJM0K4Uu9yg2coolVM64PnNS/DJIusNxuUxY6WTeSSiFjsG/A==
X-Received: by 2002:a17:907:1b27:b0:ace:d587:2f3b with SMTP id a640c23a62f3a-ad8599e8ce7mr426815966b.22.1748178973722;
        Sun, 25 May 2025 06:16:13 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-b396-c900-1e86-0bff-fe2f-57b7.310.pool.telefonica.de. [2a02:3100:b396:c900:1e86:bff:fe2f:57b7])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-ad52d496550sm1528621266b.134.2025.05.25.06.16.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 May 2025 06:16:12 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-firmware@kernel.org
Cc: brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH] brcm: Add symlinks for Khadas VIM SDIO wifi config to AW-CM256SM.txt
Date: Sun, 25 May 2025 15:15:22 +0200
Message-ID: <20250525131522.965580-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Khadas VIM (1 - the original one) uses an Ampak AP6212 SDIO wifi /
UART Bluetooth combo module. The SDIO wifi config matches
brcmfmac43455-sdio.AW-CM256SM.txt apart from the comments. Add a symlink
so the wifi part is supported out-of-the-box, without users having to
add symlinks on their own.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 WHENCE | 1 +
 1 file changed, 1 insertion(+)

diff --git a/WHENCE b/WHENCE
index 93f849c..2649c97 100644
--- a/WHENCE
+++ b/WHENCE
@@ -3087,6 +3087,7 @@ Link: brcm/brcmfmac4356-sdio.khadas,vim2.txt -> brcmfmac4356-sdio.AP6356S.txt
 Link: brcm/brcmfmac4356-sdio.vamrs,rock960.txt -> brcmfmac4356-sdio.AP6356S.txt
 File: brcm/brcmfmac43455-sdio.AW-CM256SM.txt
 Link: brcm/brcmfmac43455-sdio.beagle,am5729-beagleboneai.txt -> brcmfmac43455-sdio.AW-CM256SM.txt
+Link: brcm/brcmfmac43455-sdio.brcmfmac43455-sdio.khadas,vim.txt -> brcmfmac43455-sdio.AW-CM256SM.txt
 Link: brcm/brcmfmac43455-sdio.pine64,pinebook-pro.txt -> brcmfmac43455-sdio.AW-CM256SM.txt
 Link: brcm/brcmfmac43455-sdio.pine64,pinenote-v1.1.txt -> brcmfmac43455-sdio.AW-CM256SM.txt
 Link: brcm/brcmfmac43455-sdio.pine64,pinenote-v1.2.txt -> brcmfmac43455-sdio.AW-CM256SM.txt
-- 
2.49.0

