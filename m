Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 878212AEED
	for <brcm80211@lists.linux.dev>; Sun, 30 Mar 2025 10:34:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743330900; cv=none; b=LeIjDyc6t7shQi3cIW7AEtX19f2qFwiG8XswOQgiJq2HrKlp8Xg20AtVEJRCgSLB/CvggPsPnPfO8mt2BN1CBb+rae46XLsxMPgUyPuK6qvpvMZQ+BUwdC1KmAvVO6xkv3hL4jbYfUwjwXoUqlvZnlsr6eEn7CmZ7UY9FnbNVA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743330900; c=relaxed/simple;
	bh=CTFnlW/udSDv88n+9dJ8nEXvEm2pfyeAT4QAhA1DEyA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LIipwlWnLCRaQL15PmXRWAFBVoFNu/ayfk1B+8EeMB5822HkmiA21f0Vz+BcS3717l85Dh3kvw1WIx1WZXEtwDr31CdwkcGfM8Nr0aSIwZXLF4B380G7MoE7+YN3XxiYmrz2w5K7kdtEgyFtjDEjNgByXMV0f+6VxQZwJQKd30Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jFvIXFI4; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jFvIXFI4"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-22622ddcc35so39987795ad.2
        for <brcm80211@lists.linux.dev>; Sun, 30 Mar 2025 03:34:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743330898; x=1743935698; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=n6ILafFdAuS6ZwMjkWQd4TNYrYxem7zRVOv+WyE0Dgc=;
        b=jFvIXFI4uxgHPpkw9MSV5VV+NO7zjIxuoXMeOUSjDc5FOr4uYw+Ft3yJUjMZcaIACS
         kVbF3/SOvEelmk5C5UTXeJd+akQlchUBS83Uwqi7bISKSyDYn14bg8R16UiL9t1DIAI8
         VX9S/y6ERYdg5SrQOqGE4DMMsCT56wvGtiEPtjhQ0grv+UHvKuE6gE+JGYDiOc28bBev
         lYS1nqTPhIx6mSnMsT/cjMp0gNXC48GAUPceYFU2gLLUmbHQeAwVI3cooFCt3BCF3f5M
         3iyEoFOOxczzk6kgae4IbndauAsL7gvCGlhKnnqgmnswMNH9ZyxKmqMRmpzKnoxkGl6j
         Hpag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743330898; x=1743935698;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n6ILafFdAuS6ZwMjkWQd4TNYrYxem7zRVOv+WyE0Dgc=;
        b=h77cQ9hrIqNVR4h2tdHYUfuxC8ihcgOA0qSLqv3p1cbJeJ5jyol/1N74p4tqoCvrhb
         FR6B+SAy7L2Zwvd9zo5/u8lJcYeEuOH/0h0ybTXIKrV9+aOiuyAti0DGMpmXSuxCXUqt
         Pij1X/3fnCOrx8DO3bqojQ/R0FwmHiaLbwCAadTR5v44zCjWKrcEVK25vpn+asUYRyvs
         /dGncF47O2BA1IH6YjK/Nf7PDEia8rmnKECpZru0FPY4ZAHgIJUeJM433F+m6e9qGokQ
         LXVI33FbFRh9/9oewRv8yRoxS33VbT8tVGeG6jqsOJVvbu7Z5jY4hjlCqKfvbAGChRNM
         gAcQ==
X-Forwarded-Encrypted: i=1; AJvYcCUJ24dkfjnE05rw7fhDaWmrYeY4YUnYbK8DftNYVEu7ySLI9dvpnMxv8oPPS8dp9kd/y8imqfIS8Gs=@lists.linux.dev
X-Gm-Message-State: AOJu0YysQrUDPkvkeunSd5AKDpVgAEqsUGAF66ZhrAeLOXwAdfiRi/y0
	nwho4DEjX5zNiRNSHf/R/qu8eSz7P5hXvQQcLSe5wbCX/+uNfT0G
X-Gm-Gg: ASbGncs6BVCcJDezEWRJsSLz+YcQO+i92JZ4du2OVdvQoBMEauTGNoh7CuXLx+oTl+I
	NXosMJwHei7w/Ac2Z2kpUiYBwwl8v71obJoYx0azbURT0Ai7pekYAB4s2ind1f/wYOdIlfE6Bgn
	dxd355Qy5SI4+bmalnmtl1XOYYfFJ2wZifmStSsiHLyXmef5A7KR2HKGpQ/YhwN9E+7yDBBQcvI
	3jm7jwMZ9b2CLgTkioI5SngwOBzO9DXeThjO80hJv81OZhkuym28J/DCGou0GmtSFWYbh82YaPV
	vqA1YHrZDHVUY1txKXqgSYM/dRcM+6wbwdIbPcwOtV3KgziSRPiY9tUXAcD+
X-Google-Smtp-Source: AGHT+IH8jyiJdNbL2Tnz5sqZEPmHYfQeGIc5jmN+yL9P7wGGppF5FQlkFCFXB02xpCFhvQ80wcUgUA==
X-Received: by 2002:a05:6a21:3408:b0:1f5:79c4:5da6 with SMTP id adf61e73a8af0-2009f5bcdfemr8257677637.5.1743330897784;
        Sun, 30 Mar 2025 03:34:57 -0700 (PDT)
Received: from localhost.localdomain ([49.37.217.226])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-af93b67f3f8sm4617113a12.7.2025.03.30.03.34.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Mar 2025 03:34:57 -0700 (PDT)
From: Abdun Nihaal <abdun.nihaal@gmail.com>
To: arend.vanspriel@broadcom.com
Cc: kvalo@kernel.org,
	u.kleine-koenig@baylibre.com,
	jeff.johnson@oss.qualcomm.com,
	toke@toke.dk,
	abdun.nihaal@gmail.com,
	jacobe.zang@wesion.com,
	megi@xff.cz,
	sebastian.reichel@collabora.com,
	linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] wifi: brcmfmac: fix memory leak in brcmf_get_module_param
Date: Sun, 30 Mar 2025 16:04:24 +0530
Message-ID: <20250330103425.44197-1-abdun.nihaal@gmail.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The memory allocated for settings is not freed when brcmf_of_probe
fails. Fix that by freeing settings before returning in error path.

Fixes: 0ff0843310b7 ("wifi: brcmfmac: Add optional lpo clock enable support")
Signed-off-by: Abdun Nihaal <abdun.nihaal@gmail.com>
---
V1 -> V2 : Add subsystem name in commit header as suggested by Arend

 drivers/net/wireless/broadcom/brcm80211/brcmfmac/common.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/common.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/common.c
index cfcf01eb0daa..f26e4679e4ff 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/common.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/common.c
@@ -561,8 +561,10 @@ struct brcmf_mp_device *brcmf_get_module_param(struct device *dev,
 	if (!found) {
 		/* No platform data for this device, try OF and DMI data */
 		brcmf_dmi_probe(settings, chip, chiprev);
-		if (brcmf_of_probe(dev, bus_type, settings) == -EPROBE_DEFER)
+		if (brcmf_of_probe(dev, bus_type, settings) == -EPROBE_DEFER) {
+			kfree(settings);
 			return ERR_PTR(-EPROBE_DEFER);
+		}
 		brcmf_acpi_probe(dev, bus_type, settings);
 	}
 	return settings;
-- 
2.47.2

