Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54BF42918E5
	for <brcm80211@lists.linux.dev>; Thu, 24 Apr 2025 19:43:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745523803; cv=none; b=KP9+lnhvBOsMuCmf0R4e9rKxR6u2vyw/6ZSt8R9HRYuqnWZEksLIJaVLpBHKqnFhZWkOxs0OsrFHOWWDZFFrwLFyX4uZfEJkpP4SK6b1BrtBLRsT1DE44cgB+IyaJqEdt0FfpQmgFkL30+i0l3uWrFGxcPKlbmyNhcm6jdKhl7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745523803; c=relaxed/simple;
	bh=5p1ghz030t0rLxOmI8c5IYOtY817sRraSfxllpncENI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RxvUqKVa65Y+4J6EaaIJzc4h4S1Kdwa+C3CrdcV4c0Aup4F3pjU65A54LGWdhdIKMsuW4fZIH4jP/MXt4tkkw1sThDuJT5VykDwmvAlvWvOL2pmudWxi2Z5cvkDjfjpo8jNUlUrvOzlUqZVwGARpSeljr2fYbdy2S1hrEFKypJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=OBTSglkW; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="OBTSglkW"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-736b34a71a1so1669063b3a.0
        for <brcm80211@lists.linux.dev>; Thu, 24 Apr 2025 12:43:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1745523801; x=1746128601; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2UZxtW3kPc6nJSgpcHu4czu11dbH1HDpqjV9mIbR79E=;
        b=OBTSglkWAShvI/B0Ao9tiXmy0e5a4PFz5s1OmLesYaBlIfuBL360iCxhbgFHqNVGT6
         2bOh3yrWO2sssdYee9NWoKCv1LiDEybU0yoRMpUyIfgcdGnGtNfEI+FXRSKAyu+1Xh+c
         mE3YGbm4soqll440YMfmMK8BFuB697tG/Xao0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745523801; x=1746128601;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2UZxtW3kPc6nJSgpcHu4czu11dbH1HDpqjV9mIbR79E=;
        b=tBwhPPLPIJNs3UrmQKKPqYmyMbTshgiaL1KtzykOk4UrfLHQff5wTXOPqejSSyL6n9
         g7F5wDfGJrH0bx+s6EHlSRoGjx98h42r/3BeiPx7mwL5W2dbvAGlVoGGSw0dtDEgIE70
         vCMAIjykv/Rs034UR3o5nRR81tkVKPqmwHbKw6LVuu6bx2LCUH0XrddWWFpfyeFbQWlI
         AXEhYq+pB6uW0K+kyaDjTF5qWlHyRe3eGFo2HKMJvruZKUyAPHUipPgHlXJybBTlieQu
         uXDeVX0F0WVtwb4v6ADIb+Zi7Dy1B+lLRe8BHXwlPx1fbguviEizUUyThjdiodEH2Fzh
         xw1A==
X-Forwarded-Encrypted: i=1; AJvYcCXoxdwnwwwgLww+xRbAIZWHN7eEynVN8ekzoXR4iHAMDWtol3Yy7nNGeWRSTLuoM1IPycWxc2M2W7g=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx0pwML5HXNPF5oh2kLWzSZpgueLOFNbZSt6fExVVkkWli0BVxv
	c8LnA4qDmpTXqQpCXC5Bnmm7txQkRJaCLy516cf9rD9S3X81yULF0tXTbQFrBt/dYPCQCyiNfO6
	99A==
X-Gm-Gg: ASbGncvvoOB4Yrvfwnp2RGlXb04W27ucDA6ppHNcL1iQmMuRFMc3oeycmOfkviV41ON
	LfMIrET5Vz6yRMj9M+uVLrXr5Bp5hCwKgMF16qI2LwVgE7Co1lYXdYnJbcNZ/T95OEA3OqA7376
	vR6r9KkGvntoVI3qbERDFqL2/py+Vl8iMuhfYtOzyX9hxcQ8WfkpbNhZYcIhVSEkaeyPAqETp/G
	CDWwRPWey2CFXeuKq+k2+C3Kd1RsStYGUkFWD3JldECA2c/B2/LdofMe+k5q1AKWFA89+Gkr/zz
	1Vut4ctmjSc4gkxQj5CjZ1QJ6C4WcDb6XPLhbfnDaDRrWaISb6axhYNk4fmVzbkwSPhmNbzLtGn
	62D1mx22l+021NzWd2/HR
X-Google-Smtp-Source: AGHT+IHj4pkMXkAmfOw0WGb+TKWLQzOHMU9HfinAmJwV6gaK6xC7xQI23oPWVFzELRh4N7q5scq8oQ==
X-Received: by 2002:a05:6a21:8cc6:b0:1f5:7873:304b with SMTP id adf61e73a8af0-20456715904mr698677637.26.1745523801549;
        Thu, 24 Apr 2025 12:43:21 -0700 (PDT)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73e25a6aa52sm1863494b3a.94.2025.04.24.12.43.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 12:43:20 -0700 (PDT)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	Arend van Spriel <arend.vanspriel@broadcom.com>,
	James Prestwood <prestwoj@gmail.com>
Subject: [PATCH wireless-next 2/4] wifi: brcmfmac: make per-vendor event map const
Date: Thu, 24 Apr 2025 21:42:37 +0200
Message-ID: <20250424194239.2825830-3-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.43.4
In-Reply-To: <20250424194239.2825830-1-arend.vanspriel@broadcom.com>
References: <20250424194239.2825830-1-arend.vanspriel@broadcom.com>
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The event map is not intended to change so make it const.

Tested-by: James Prestwood <prestwoj@gmail.com>
Signed-off-by: Arend van Spriel <arend.vanspriel@broadcom.com>
---
 drivers/net/wireless/broadcom/brcm80211/brcmfmac/fweh.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/fweh.h b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/fweh.h
index eed439b84010..38a9138f1fd3 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/fweh.h
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/fweh.h
@@ -337,7 +337,7 @@ struct brcmf_fweh_info {
 	struct list_head event_q;
 	uint event_mask_len;
 	u8 *event_mask;
-	struct brcmf_fweh_event_map *event_map;
+	const struct brcmf_fweh_event_map *event_map;
 	uint num_event_codes;
 	brcmf_fweh_handler_t evt_handler[] __counted_by(num_event_codes);
 };
--
2.43.5

