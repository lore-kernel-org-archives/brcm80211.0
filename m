Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA17A8634C
	for <brcm80211@lists.linux.dev>; Tue, 12 Aug 2025 12:36:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755002209; cv=none; b=GHijnFVMiy2+n1Jjb2trYA4yQMPuUoog7zeCHg/fpqNk+o+C+A3VHvW2y62g2Tvl6eaE+2V+oH7GXPyC/kpdoLSSJwhkXLdzjhFEWJYUQbV/l+I0Khj4lXlOyBXjUtA0TD437KD+HQ+7l8LbMhgC/Hhp2U2W0YiJg+Ipl3czWMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755002209; c=relaxed/simple;
	bh=36qCfev6CBHhrWddvv28EObqicMIqSDDel4IWLfJoNs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=R74+8pIK3y7tySEOEPe4vZgviWssK7CuoJ9t/Q+dDuW04y57gBCkbDhI90JduR6as7JjwATqNG8zp6qWX1/8FEcfsyf9SmcSDowN+V3TD608KRS+BliHChwNd51Q+WERTzwJkpF/gpiK9C38fVg9DL72A6krqtKU1JucT6pbkqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XKf+vZ6l; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XKf+vZ6l"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-7425bd5a83aso4588475b3a.0
        for <brcm80211@lists.linux.dev>; Tue, 12 Aug 2025 05:36:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755002205; x=1755607005; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KCP9QD2yVDf9WyEMP7gZz0SvVxf9faaBdK+nGQh+dYM=;
        b=XKf+vZ6l4XvYbdwmavV+W5oMUHMVw7T1LW1E+K/07l9kYRAMXOhOQR+9DT4uGqNb1z
         R83MtlSj8IEyiTzXK8163u1PvBdNsLqUJ7ZuovfRSsU47FdsF3ZtGsw2QGaVVJZGGsXH
         ivpcBuK4iUUDvDRfJjLEMh6cOPIO0aYimNlBUieiixOel8JoaMRCMEWRMl0UGCMAE3mI
         xse0UEdGB/r7uDAfsACfqptlobevuIql3Jl8jIYiSq1MWuRSNc15B4/J0ayqu7Qpl4OK
         byrGGAc1qf0wJKKU9M4gpOQprLcNg5EV47SR3T95OD4xgmwOoz5APH7ACyIfsN1xvfMu
         UjXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755002205; x=1755607005;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KCP9QD2yVDf9WyEMP7gZz0SvVxf9faaBdK+nGQh+dYM=;
        b=NE6K2zE78IQroogJl4Rkx5ffAP6BiC801NBLS/giXg19aqxTS/KpSkPvIWZSyq8J/o
         OWqNjYOP1yYtqSzogtBAMnKWbhrcOV5EQUO9PGHNF+1m5H8w6oiKza7AZL5Xu+bn0lo8
         UST7AXBkTugxM5pnS+6qDSEpQyFQOSkLHiiqPyhxXBPFc9FBMWU7JJAiE1XA341Mtpmg
         fKoiPSSck2x5I9tqSCcol5gvJT9Khg3OpCVUZPmr19Bl5t+lRhXm1t8aDu4tQ6S7o/eE
         3ztF3knsAsOpdkdWt51xUQqUQvNK+LJWJreMJiNSz0jtYcDcS8a9FKZPKK1sBxoUxi8s
         yChg==
X-Forwarded-Encrypted: i=1; AJvYcCWJpD7Kh4gFVfdeCkjAoR+lZqs/v1+k3aO2MRYWlhgY0PBHPXX7qmD/sMfDs3RlV2c1tNm794q17U8=@lists.linux.dev
X-Gm-Message-State: AOJu0YyQYz30LWgHpbt75UZsjctDCi9GVvHaT2swGVY1f+xqWdHDBzRJ
	ebn3NdRp5E5u5vvtwrV35epH59A7dpGk0gl574VI7qtWnWaE+Yam6CWl
X-Gm-Gg: ASbGncsJmUBZeAt0/xhjmySw3Lyc9sGrwTRlIMFA1cn6GbXbEs5g+hHgTUWmjhxekmj
	Me2wmV7UhQKW+8/0q5gtfAiCga0ehL6PePTE34NOHsznkXR0zFf91bNUeEZfNZpQyZnh3K0OVl2
	ibiopkm24YslrZdfo5hLPpkO/JP2Ye6dM5n/bUbj9Xhv/bGKFO5xnNpxswE3KqDTfuvbNKONvtd
	R1oBPTBki/H2PrtBuRXYpmSP10JI0/BsCS4P5M5TLndUBkeK1NdizsOqqXkTO9LqEhm1jmi+Xvb
	6d7p80T725qgUecXWrlrTcTCbFq4pYWEHT+Glrr114H15OYnzNYXGGsIylCED6Kl9tdX+eFlyDg
	FDB8q1pIgYYKNuqjrVeiQ9PbUuFNOuDF7vz6VHZpHwtXQ0B+p
X-Google-Smtp-Source: AGHT+IHZ/ewI4Y6s4Ti2kEtLEeMRKw80tXrowny5hfX+HTcxoMLrIZ9RNU5wYF2LB6c3wyXwKrkCxA==
X-Received: by 2002:a05:6a00:2195:b0:76b:ca98:fab4 with SMTP id d2e1a72fcca58-76c460d2e40mr21394486b3a.2.1755002204566;
        Tue, 12 Aug 2025 05:36:44 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:8898:77ef:d42e:3af1:d5eb:7170])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76bccfe50c8sm29337295b3a.120.2025.08.12.05.36.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 05:36:44 -0700 (PDT)
From: darshanrathod475@gmail.com
To: arend.vanspriel@broadcom.com
Cc: linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org,
	Darshan Rathod <darshanrathod475@gmail.com>
Subject: [PATCH] brcmfmac: avoid assignment in if/else-if conditions in NVRAM load path
Date: Tue, 12 Aug 2025 18:06:36 +0530
Message-Id: <20250812123636.2142292-1-darshanrathod475@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Darshan Rathod <darshanrathod475@gmail.com>

The NVRAM selection logic in brcmf_fw_request_nvram_done() used
patterns like:

    if ((data = bcm47xx_nvram_get_contents(&data_len)))
        free_bcm47xx_nvram = true;
    else if ((data = brcmf_fw_nvram_from_efi(&data_len)))
        kfree_nvram = true;

This style violates kernel coding style guidelines and triggers
checkpatch.pl errors. It also slightly reduces readability.

Refactor these cases by separating the assignment and the check,
ensuring behavior remains identical while complying with coding
standards.

Signed-off-by: Darshan Rathod <darshanrathod475@gmail.com>
---
 .../broadcom/brcm80211/brcmfmac/firmware.c         | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/firmware.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/firmware.c
index 83f8ed7d00f9..ef79924fd8f4 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/firmware.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/firmware.c
@@ -554,12 +554,16 @@ static int brcmf_fw_request_nvram_done(const struct firmware *fw, void *ctx)
 		data = (u8 *)fw->data;
 		data_len = fw->size;
 	} else {
-		if ((data = bcm47xx_nvram_get_contents(&data_len)))
+		data = bcm47xx_nvram_get_contents(&data_len);
+		if (data) {
 			free_bcm47xx_nvram = true;
-		else if ((data = brcmf_fw_nvram_from_efi(&data_len)))
-			kfree_nvram = true;
-		else if (!(cur->flags & BRCMF_FW_REQF_OPTIONAL))
-			goto fail;
+		} else {
+			data = brcmf_fw_nvram_from_efi(&data_len);
+			if (data)
+				kfree_nvram = true;
+			else if (!(cur->flags & BRCMF_FW_REQF_OPTIONAL))
+				goto fail;
+		}
 	}
 
 	if (data)
-- 
2.25.1

