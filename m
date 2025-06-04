Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A345479F2
	for <brcm80211@lists.linux.dev>; Wed,  4 Jun 2025 08:55:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749027349; cv=none; b=kbFwpX3SFF6UBfQbQC2IKeU3vxHaKwRG6SBd3SVYhKQ0FMOWJ8s0JQwneCaFxVRRAmeo/9OmBIxjbtT0rMf3jhF1tf4OIjRrtJRv6cCkTSWdK0+DbiqLoPgtRLeuHVXxqFQm3x3J6aE2bSzbT61jgBvLKopRyJKa1KWELdDD0Dk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749027349; c=relaxed/simple;
	bh=6hHp/Awh1FhOfOPS4xdPMFToVX2HzERItM9piZXQNx0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nEfa5yjtfVnvELS3qlbuHgMnmla6uM4tIaak470ZU51/Zy/zVdFvEqtvNWhv3xGFdviXQGubpLBnpIBJrVSdRHKPQAlsWlmC8SHEwKV1sM5kSVb+D9rTDzvb3M3sh4o+0ERRPszFm85YzR0oy6k3L/ZPCo5UgrX8SY/1aphG2pY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=gS1o6jlv; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="gS1o6jlv"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3a50fc819f2so1966368f8f.2
        for <brcm80211@lists.linux.dev>; Wed, 04 Jun 2025 01:55:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1749027346; x=1749632146; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=y2y4fSm9Q4/lc9XkmVRnaW1rCfsvHl7po2HGQF5ZOPo=;
        b=gS1o6jlvV5QqY6hVxLH+izykkJ6RgGC2LSI5LpWvFvWhLdWE7ixpn6oOcnl9yLZ4Wh
         aINzef0YR/1Rb4Q3rK9ulnOj9t76FuLFmu6BBJwt6XfFMKWgim0S5e/vKatXU8SkMBIa
         vXhe/pGoLPJt49uXAhDC4w2Rb1iTLnh0dwBa8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749027346; x=1749632146;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y2y4fSm9Q4/lc9XkmVRnaW1rCfsvHl7po2HGQF5ZOPo=;
        b=Yhmb3fctEOTj0SV8ngFLmpsTpMNx7Qt6YLzkfXf6a7ADGzA/I4HKFITrOnPoHixlFT
         TXTHGy4DINhK3z6gACCDZnsWnm+UMOOk7Z24u71vXB7fUWB900VtDiwor+cR4G0XLrp4
         Ub+5tZ66Gz+pjLv01KqDSQ11fPadKMNUPsrkaQHKGr/T5PR8j/1YLrBhlP0iznJil6nu
         VrbUKy5PWFsAFwyyesBoBnGjk5IvRoGH/F5MYZwsk7E3c58jBGu3praZe2hLZTjMYPBx
         oM7cnONuPfTidemWL3RtNme8WeReHq39HacrjDA1R9QP8LdIXLS77FoXezmjOLhQ2Hh9
         oqVA==
X-Forwarded-Encrypted: i=1; AJvYcCVNjxJsbtMXzvUtN6gAAQCmKWALIRwtaN3ooHAbkOk4NvZ9y9BQmeYCf/alRpS5nJBouoiEw1hLE3o=@lists.linux.dev
X-Gm-Message-State: AOJu0YxMQweT78HHOeXYGVuJNIFmVJbNYpfg1vJye7E4KRe8xiwVtJqg
	fXObH+tQV0iOA9QhXbhyBTzHnhn8sz1UZjQa9EToKakO7RO6S/6/24SUdbKI2LHweA==
X-Gm-Gg: ASbGncsZE1jS0zH0OyWv8UqNBEAvpCiTD4jmWywJd5IXGhc8v2HzRkV94cjy7VshnCS
	/LCIZNhPnu6JRuFa29Bh0gVWgmClPeJRudlZkEaUyaxEGIcXz3sK8DVVFPVa9uDNWMFpiEWLBfY
	Byn+wzHxQnWGHmn5WrrWnfli/3t9+5O0+MJUPOJQcLocq07FsKNrg79s3VSidI+CMvRNizza5N4
	0pBLaWEcxA+v2Qg8Sj3llzaC36m3YYOaW3MjG7L3lLLSLOCci00VFn9k76TMf0bBMqCff4kHSwY
	PJHNrqM0a/fkPlFkWZB4cyNVQdlR8BY3/Z70B/YM8T3pid6lnSPcjQr3L0TnHqEyBoQabBDj4hC
	tYAYVKt2cFRI05y86++ls2/agiQ4WEU4=
X-Google-Smtp-Source: AGHT+IFfcCs9qc/nsp54S9qOdKlt7sOskk20daGgdeH6AuGyzZQxhTtR5fttEBjqDkiBgmcYsZ2WNQ==
X-Received: by 2002:a05:6000:420a:b0:3a4:dd63:4adf with SMTP id ffacd0b85a97d-3a51d968a18mr1452970f8f.34.1749027345910;
        Wed, 04 Jun 2025 01:55:45 -0700 (PDT)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450d7fb09a3sm189165695e9.24.2025.06.04.01.55.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jun 2025 01:55:45 -0700 (PDT)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	Arend van Spriel <arend.vanspriel@broadcom.com>
Subject: [RFC 0/4] alternative changes for NL80211_CMD_SET_BSS support
Date: Wed,  4 Jun 2025 10:55:34 +0200
Message-ID: <20250604085539.2803896-1-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Here a series with my idea on how to solve the fact that drivers may not
support or handle all parameters contained in NL80211_CMD_SET_BSS message
as sent by user-space. The driver can announce in the wiphy info which
parameters it supports and user-space can indicate that the kernel may
enforce strict checking for the NL80211_CMD_SET_BSS.

Arend van Spriel (3):
  wifi: nl80211: allow drivers to support subset of NL80211_CMD_SET_BSS
  wifi: drivers; indicate support for attributes in NL80211_CMD_SET_BSS
  wifi: nl80211: strict checking attributes for NL80211_CMD_SET_BSS

Wright Feng (1):
  brcmfmac: support AP isolation to restrict reachability between
    stations

 drivers/net/wireless/ath/wil6210/cfg80211.c   |  1 +
 .../broadcom/brcm80211/brcmfmac/cfg80211.c    | 24 +++++++
 .../wireless/microchip/wilc1000/cfg80211.c    |  7 --
 .../staging/rtl8723bs/os_dep/ioctl_cfg80211.c |  8 ---
 include/net/cfg80211.h                        | 30 +++++++++
 include/uapi/linux/nl80211.h                  |  7 ++
 net/mac80211/main.c                           |  1 +
 net/wireless/nl80211.c                        | 64 +++++++++++++++++--
 8 files changed, 122 insertions(+), 20 deletions(-)


base-commit: 1b98f357dadd6ea613a435fbaef1a5dd7b35fd21
--
2.43.5

