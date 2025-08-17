Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 731B9217F27
	for <brcm80211@lists.linux.dev>; Sun, 17 Aug 2025 09:41:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755423678; cv=none; b=eJFehVHkTXJgQuuhhaKhn1g3iOHzkcVXCwMWJlY3zt6v/D5w47s29P+3W7U8jT2yBsaZd4RSxldbd0WOJcfpolAmi4ZFUfyoW0ijYzTGm5aK1+kMmpmxIC/z9/Eu3K3+uslI9kU5s5mVwCOxZNwXcWBR75lUVvooiGz7XrDrf+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755423678; c=relaxed/simple;
	bh=tYVHe9Aemop4I8tQPMkluI1puokuZbTfjk2Bink7Slc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bhD3S5fl3fZGpeeKe8Uzq+pb3o/tDPEWhxp9GpQNi7SM2XrE6dqQGCY8USRkzn5B0TV8z/cYfGlSLfVtKk0WLQbOYxSI32/ENoyBZkx8vLKSCbl/Z5B+QVQ3QOpPkAz4L9a64AhedQa5J8TdQpNoCGN3lDvv8EWKFrzBmj3V49U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=Q46Zr+L6; arc=none smtp.client-ip=209.85.219.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="Q46Zr+L6"
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-70a9f5625b7so32485686d6.2
        for <brcm80211@lists.linux.dev>; Sun, 17 Aug 2025 02:41:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1755423674; x=1756028474; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IOf6nM9z/FNgdzr+RRXAWsT29ZV2aI9xwsVeixOlN4U=;
        b=Q46Zr+L6YJKF+5pvU1H5Xb0eABjjhMKn8j3ejS/yViblZlsBOqxFSsNWaWnwyGy3Ac
         DyvKFJzyrKCFP9OTUk32rbxK0+pz5YZBggKBsNqDMWxlj9DNW5KHZ64uj54xX+/cZJAH
         OQ836iy2u3QHokAwPO/mp3GmxswDhJ1Hwo+w0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755423674; x=1756028474;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IOf6nM9z/FNgdzr+RRXAWsT29ZV2aI9xwsVeixOlN4U=;
        b=C2KcoYkJYE9Y27shW5U3tkkzjpWapbv8tjlVjSkHnGOeVkyMEiyZ9NwmpVTYl/dj27
         NIWZI+hkoIVN7gGsDudnezBag0AHRmh7D3tPBhUeZ5fQrK5NGGigEkVwPTc++QQ9aHJ0
         lhgnyATK4Nxml2DZwNAaTYccP58SWFuyKaOETJkR4h8ChM82abI08R1kz8GIjOONw369
         7fBAynGk4DurcOCCV1XUDwVCaNXcBOvU8CLxwdaSefgqlSQqmgV7wxVxH+CF9vnEnWp/
         GxUtk/mhvFpzhqjpVZwReJfLeO8IbPrZQ/D9+dUJmfyLcgf2jO88lC3Tn70tVCg2IvD5
         MJtQ==
X-Forwarded-Encrypted: i=1; AJvYcCX56Yyszrcj7Nwek9LUeZUl434FZvV0FIwYfL6h4pSIUmDJFiM3cFlnDJRvCbrG3j68KyzdnxkHBlo=@lists.linux.dev
X-Gm-Message-State: AOJu0YxmA/4oa+cKMLI6NGwZ48DeYItncD8Og5P2/Z/9/37p/gNOBH91
	6ADtIogFV3Qz0y5LztCB3iaWq71pQ+KcoxEdDt6ZEBNZ5qF1x2UzVPUdDXqz7tOZokJriNcnZNE
	OcfgZFL11
X-Gm-Gg: ASbGnctEp9Oy/yg9rYqSpjmkYFYZBUxkgs8FZPRrE5EUxLrvrsumwEuZEg4WuB9ukRA
	EOUF3ulWOA2NYyFpJW3U6f9d+Ym7aX2HodCcj8JJPBnHktZcMwU4pe2PQKvDBRrxQ0+C5kQ19Gs
	D1J/X+rffQuU+AL9ORTUjnwODF75jSxNy3796LYvX7bNLIknKQ5oevXKzi0hL1bJWaP+5UlCmr+
	pBi0VuaS0CuY8vSMYtWfAOoE+fEcEMttwiAbCypZBcx1ZrHLjifYpFAt5JqqKGvdGRadhA1BofD
	yu9fqFL9Dz6GrxJ88rNvJVTZHFGgRPUVO0NbeqG43M/RVqFsnTjQHh5Re8GGTqnvhtkF6V9ZOCw
	NGcwx/aG2ZIRPgk829SOzIYg2znI8w/ogvbpj8W99DqOEmTvYvaLh0I+ddhl3eQ9iYrVxoqR6X1
	cv3HBBlA==
X-Google-Smtp-Source: AGHT+IE4FSCfSlwTloizbtYnAgm9CSWMGk5sSYOkkx4tW7xHYf656/W6IVjSDrkvU4sbTajRgcQChw==
X-Received: by 2002:a05:6214:3003:b0:704:9239:bdf3 with SMTP id 6a1803df08f44-70ba7c8446bmr88003936d6.40.1755423674285;
        Sun, 17 Aug 2025 02:41:14 -0700 (PDT)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-70ba902f819sm35706346d6.9.2025.08.17.02.41.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Aug 2025 02:41:13 -0700 (PDT)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	Arend van Spriel <arend.vanspriel@broadcom.com>
Subject: [PATCH wl-next 0/4] wifi: changes for NL80211_CMD_SET_BSS support
Date: Sun, 17 Aug 2025 11:40:59 +0200
Message-ID: <20250817094103.941090-1-arend.vanspriel@broadcom.com>
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
  wifi: brcmfmac: support AP isolation to restrict reachability between
    stations

 drivers/net/wireless/ath/wil6210/cfg80211.c   |  1 +
 .../broadcom/brcm80211/brcmfmac/cfg80211.c    | 24 +++++
 .../wireless/microchip/wilc1000/cfg80211.c    |  9 +-
 .../staging/rtl8723bs/os_dep/ioctl_cfg80211.c |  8 --
 include/net/cfg80211.h                        | 29 ++++++
 include/uapi/linux/nl80211.h                  |  7 ++
 net/mac80211/main.c                           |  8 ++
 net/wireless/core.c                           |  9 ++
 net/wireless/nl80211.c                        | 91 +++++++++++++++++--
 9 files changed, 160 insertions(+), 26 deletions(-)


base-commit: d9104cec3e8fe4b458b74709853231385779001f
-- 
2.43.5

