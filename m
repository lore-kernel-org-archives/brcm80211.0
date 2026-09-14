Received: from mail-pj1-f98.google.com (mail-pj1-f98.google.com [209.85.216.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40336389107
	for <brcm80211@lists.linux.dev>; Mon, 14 Sep 2026 20:04:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789416269; cv=none; b=hWeeN5xEfOP/H1kmnRiXjIMEJb0U/C4Moum6sccyOUPc/vztEFWtGdsb9JgaQaaudLSCbuMNKbveF0rvEcNoiRkTF+QAQ6sq9R1Ja21gIR2n0hp1e1LSmy/Mo/rybqeIYPaJkGcQd15iZAvQoaPilN5wnyDDN1pfVRthU5Mr6V4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789416269; c=relaxed/simple;
	bh=oDNnoTLAG3z5e8XehABOObZ1Jm57MalG4FqBQTsd5I4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SOygBGz8nYrffx4l43hYb31CoNpMagnXALRjQZzB4RkWF2Zy+Ovk8bLlpv8415vd9BuOlx5jXNxL6nzGjmNai64UZPGdjDPohiKwdV6goIAARElV6nw738rgQBASpT787zEcy5QxqIRVmBposycTLMO+qNdcLtP2KfFzxznOVdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=TzPnkWMA; arc=none smtp.client-ip=209.85.216.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="TzPnkWMA"
Received: by mail-pj1-f98.google.com with SMTP id 98e67ed59e1d1-3856d6fbcb3so3619875a91.2
        for <brcm80211@lists.linux.dev>; Mon, 14 Sep 2026 13:04:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789416268; x=1790021068;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ptl2eI5BrtYzmF7s/oP2Y6D2qarZoa2Eb/4pwhgjoQc=;
        b=DYQIwHGAo8cdUsbdo2OgPcFV9jmhIUElI6/PjZa+I9Aqs1U/B1gH4JUr1eNFQcizhZ
         /Hz1IIJtfMlyzxV3ZQFt+uK3mqrYFyyS+T5ZhrgQ++q/flSA91yujchH/3M5C6Y3BDXD
         xIWMHgE1UgA50o1+pYcvkOunGiqQODxrC1b5APnWtXjSA2wHDFsoKfPmHgrgOlx4aq1t
         jze6VPGnhdLrDE0UwDijVNq6jq/pVl7EdUJgKeA/1x1tz9D3DLvanJqAzVyBuu3yTo+K
         PsSND/gd0M73ncBa/iumsBPu+0AtRAz4LscX9nTDBpJE/PiSLfLd4eTHTc7gsRaFAs75
         lICg==
X-Forwarded-Encrypted: i=1; AKwUvBwFHrrStR5GivP4pTakw7BK6mQq7F++1Lvqf+2a///4J6jcZxzlO2HaxX64P7uctaNXYxwVwcknEV4=@lists.linux.dev
X-Gm-Message-State: AFuF++kjNjP1YdRWAMnKf5sn4R5fzrTplrYbBSn/hS6C+vlpu2X+3cdQ
	4aEaONi+3UETpOJGQqLaIYiMxjPM5hM4DnNk9g0JxT+BwVQPyXuCIX+GUA26yYTYP7jQg816i2O
	ABzrgCLNczQm6Bli3HrhtT4BY3lIP19EkkSyeRT0hSQZo1v006cpgAzaqqdpY1/irNjVY8zFMc3
	aDd/R8IlGjT0GFcer8YXLZ6EHfr25pfBkysuPlXuUz8Xcja0NV0LjGMg303qSDxj8HDnBk6J/D9
	v7XJpT8pRgj/xg4KR1gmw==
X-Gm-Gg: AYBFou3X08q3MEbC7dAlaXO7ZJrkIdirgdqYF+3g4RBaRjK3597n877PA9AAACYYkVa
	x02BDMU0M5WURtSftiLAvJX/tV7LSpofdkQ9rSRikSOYn92r0PxZBhKcWI+m/wlRo3MQUVCzmSQ
	svWoFvN7VNjMikpLqIlK7fcVc8+ANVhgF5zHsgV/Cp3Dpyqj1oUt1SWMO/ddLS0IvxtEsnGQIEY
	aGqcoca6vIv7l2EsQ8h8ipfFurDE3Dgo8OuYeVt90lB1DqAKGcntpH7ElDaT69blbm55St0pb9G
	QuYWGwGf8eqvh/1/wgPmDB6hE23LYdx1SazM2fSQOCjsNwNNKLuTAEWjr+bER3AH3QP6j3etdZK
	bLxhd9986oC4A82nKfSZk6ZMXZsHzUVkkaCvAbYURm+PeJECeZv5HnSB+ayN1TFp8i77LJ5vPgA
	Q7hYH1taPSCOAPMT5fY5sScRCRK0t04eulhYa4PHJfJw==
X-Received: by 2002:a17:90b:288a:b0:39d:e43c:5a0d with SMTP id 98e67ed59e1d1-39debfc0f51mr8828602a91.8.1789416267568;
        Mon, 14 Sep 2026 13:04:27 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-125.dlp.protect.broadcom.com. [144.49.247.125])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-39dfdc39bdbsm283149a91.2.2026.09.14.13.04.27
        for <brcm80211@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 14 Sep 2026 13:04:27 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-90cddf4f59eso75997676d6.3
        for <brcm80211@lists.linux.dev>; Mon, 14 Sep 2026 13:04:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1789416266; x=1790021066; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ptl2eI5BrtYzmF7s/oP2Y6D2qarZoa2Eb/4pwhgjoQc=;
        b=TzPnkWMAQHg8jHZl8CbnoZZ3YkfedzA/maeOvMKPcQxRkXdEevOXGV4qjHwBlkxI7f
         zF/gxkufJDiauDaltXJolnLQubkwNqXTQT/UR+AKNKHgrcTbeTWh8FfOK0t6BQCNAnhV
         2/H6PsMj7uAAxo9cY8DY74KFx1nzECpDV5Uxw=
X-Forwarded-Encrypted: i=1; AKwUvBzd+8GFd7IKELKy3YUlE73+yek6Bw0Yeq2cT+VsKbVwltUH5EHUoo/SLau3/uVjzFlbHBonBIr65Us=@lists.linux.dev
X-Received: by 2002:a05:6214:5f0a:b0:8fd:d5a7:f970 with SMTP id 6a1803df08f44-9122e4ff410mr64197146d6.11.1789416261447;
        Mon, 14 Sep 2026 13:04:21 -0700 (PDT)
X-Received: by 2002:a05:6214:5f0a:b0:8fd:d5a7:f970 with SMTP id 6a1803df08f44-9122e4ff410mr64195776d6.11.1789416260709;
        Mon, 14 Sep 2026 13:04:20 -0700 (PDT)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9120f47a6ebsm103068516d6.22.2026.09.14.13.04.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 13:04:20 -0700 (PDT)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Jason Huang <Jason.Huang2@infineon.com>
Cc: linux-wireless@vger.kernel.org,
	Johannes Berg <johannes@sipsolutions.net>,
	brcm80211@lists.linux.dev,
	wlan-kernel-dev-list@infineon.com,
	Darren Li <hsin-hung.li@cypress.com>,
	Chung-Hsien Hsu <Chung-Hsien.Hsu@infineon.com>,
	Chi-hsien Lin <chi-hsien.lin@cypress.com>,
	Carella Chen <carella.chen@infineon.com>,
	Shelley Yang <shelley.yang@infineon.com>,
	Arend van Spriel <arend.vanspriel@broadcom.com>
Subject: Re: [PATCH v6 3/5] wifi: brcmfmac: add PMK programming for firmware roaming offload
Date: Mon, 14 Sep 2026 22:04:13 +0200
Message-ID: <20260914200417.1744264-1-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260911065656.1269623-4-Jason.Huang2@infineon.com>
References: <20260911065656.1269623-4-Jason.Huang2@infineon.com>
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On Fri, 11 Sep 2026 14:56:54 +0800, Jason Huang wrote:
> From: Darren Li <hsin-hung.li@cypress.com>
> 
> FT and OKC roaming offload need PMK material in firmware even when

[...]

> For FT-PSK with firmware supplicant support, keep the profile in the
> PSK firmware-supplicant state.
> 
> Assisted-by: GitHub-Copilot-CLI:gpt-5.5

Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>

Regards,
Arend

> Signed-off-by: Darren Li <hsin-hung.li@cypress.com>
> Signed-off-by: Chung-Hsien Hsu <Chung-Hsien.Hsu@infineon.com>
> Signed-off-by: Chi-hsien Lin <chi-hsien.lin@cypress.com>
> Co-developed-by: Carella Chen <carella.chen@infineon.com>
> Signed-off-by: Carella Chen <carella.chen@infineon.com>
> Co-developed-by: Shelley Yang <shelley.yang@infineon.com>
> Signed-off-by: Shelley Yang <shelley.yang@infineon.com>
> Signed-off-by: Jason Huang <jason.huang2@infineon.com>
> ---
>  drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c | 56 ++++++++++++++++++++++++++++++++++++++++++++++++--------
>  drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.h |  5 ++++-
>  2 files changed, 52 insertions(+), 9 deletions(-)
