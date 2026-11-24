Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.97
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795551245;
	b=TYn65Pnc4bioKTrx4gwgxabmZ5soJ0PLbvKDgDePkfkn6SwJADGssM0VOW+f5O9OqUrH
	 SiyJyYRolr1tGmb/Ugq3TNyk8lD+yXDCcv/qjTS5h1YasgdmSuPyLaE+yNuB0qGbYKlMN
	 J7+EST/zrYXtPXa2qTiYsJiVlxDGrOXlxzv973prY3VNUUpvc3NHhPXHWwbuOGzHYMXoh
	 bqQo2kGQhddRvBHp3/kAcWrO4NPap2XucTk1aWHTBZ/SRhWKg13BWKXsA/0XOhK6Ajwdr
	 4SZL7phMFwkMRCRx+gImN+29GSvq2OKJC6JdUC3TlaOU2F9xr+vgNSJD9rhRznhrkmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795551245;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=CtbqCWcplP8s8TS4XxS3H42+jZhVRK/WEZW5XIZ9ues=;
	b=5EWcje8rCNCRMAVR9iq4rWhICYPc93rh/fsXryvZUHoc/UPuwvihWQJEjzUSZBjCE7eM
	 vyMfgTrvm9UTQPkdx3gidefidWdBs+FDeACOW9oc2pcbWZasZCCjJkvFESdyT5y76Ng5j
	 0CWH7ufQjKJ365oHQkuVEr4SwE8+8dgalt2k77mv/wTZq4MGR8QppJZNEGn8WSv/BhkQF
	 7yXCHRRbjtep92NkcHHU0W612gq+QjfBiqEGsICllQS11JZEndl2iw0MaEm1wwAtGENbQ
	 l1ummk7+07ip8Hdr7LFqrd6Ra5hjhRvVxrQ3/v9ggX9/gdHSMWfHZ+NbYrnjeQ/x01w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=ZXI3A6nE;
	arc=none smtp.remote-ip=74.125.82.97
Received: from mail-dl1-f97.google.com (mail-dl1-f97.google.com [74.125.82.97])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E24FC606A335
	for <brcm80211@lists.linux.dev>; Tue, 24 Nov 2026 20:14:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E24FC606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=ZXI3A6nE
Received: by mail-dl1-f97.google.com with SMTP id a92af1059eb24-1a2af4c8d00so2330523c88.0
        for <brcm80211@lists.linux.dev>; Tue, 24 Nov 2026 12:14:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795551244; x=1796156044;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CtbqCWcplP8s8TS4XxS3H42+jZhVRK/WEZW5XIZ9ues=;
        b=NSfbY9076bsjdFtZdfCKrtPxikboa8ZGeZ2sQGyq69nqdqYb+wKXgcvPxCkm/hu6pJ
         1+GWAe3QPePQsxALI6gIAHyyzhK44bqk1Nh2Kc4lROBFZ2A9IWmihZyRuD7zN62+RfzQ
         GbQVrJSnttStBeY8980xV6JHbfChcJCfLN+2T9zIedWkJwBi8vS19oTGkE5JKhYp+gaB
         vKUCpx/7gesi57HgPju15Ixu3RUxFhgA0O69FeeqBRv8vKXkkD+9X2P+UyPmdniwkbDP
         S8BqX1naMEWfWEIU1jTGhRYB9BdFOV3n9hQFKTlqPAu80q4AXy91PeMbMLJ3YsE824ND
         ryCA==
X-Forwarded-Encrypted: i=1; AL+hErGtdQcsXLqIgWNXBgitleJbxhdVjQlgr4eU4E4iyjPVH21/fVu0AiDcOx6r7yci1c41RzcLvj6hYVA=@lists.linux.dev
X-Gm-Message-State: APuU4Z+dIyzvNGTWEUOqaUyOPNV4FmPYxMf2DJYr2gZB7ApGNfaTxo3j
	Glt4lZ1cC78+TWPVPe6cugNuWTJ23PuRqSUCgPpr8EUGlJfDa5Sd+eawjXJAO8Um6n7x/3Vj7B2
	27Tt053NHnc8sQo2CuZw2AKOJNikWdKRH8uuZ6KrNQ6owNCREnJre2Y8jHTBuy47RrLotnl/A7v
	EJeiu+HF098RGxWm4Knw/TcbMnVP+Yc3Xp9JXhWhOfTmI1q0QUZ0PW44ppcW/ML79ckPEu5x8NS
	9BK+D8WEhhNhvixcgJ1bA==
X-Gm-Gg: AZFdTZfOjHFl50yKUlBSu3IKSgulvPmg7GBXGzL7w6+2vAUMXZyl7h0QooWlHwbqjJO
	zKP50losTfddBax4Z1+MgSEuByfRhtABj5nAb1iea92wl/WbKRVrkv2JSu+1dzAHDyXRO5wB+NX
	dDhM72jH2Str7MJ95AqBKoYtTg+G/SQnZHfMcQ8joGFtFuLUTYN2jtNzIsUdrlyoJjUQSt8VGUt
	hRQIg92YHH899oWI6pkv7iRr2DXKRL5qXVStJ6ZWX+VJINE6+w974O+x5iiJlGvpI6TbpFCRK7N
	f2RBXYXDnzqRFNymMrrMZU+xuXuk+Ehel76PqUTHTiyUnhkDpjo/ORzQFvrUsYylxY9XX9ec5uC
	USWXDzN5gxj1xw4xtr5lYP6NN7a4VIU+dXNY2w5aRz5x7M9yal9Dmyj0ER34uHzWmtJLJn2K8Rb
	8+JMehKkwzUMVduGsUAGJRJHnsu/K12OWmTbgDp1scqw==
X-Received: by 2002:a05:701b:4583:20b0:1b5:87bb:e4d0 with SMTP id a92af1059eb24-1b587bbe63cmr611117c88.23.1795551243735;
        Tue, 24 Nov 2026 12:14:03 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-123.dlp.protect.broadcom.com. [144.49.247.123])
        by smtp-relay.gmail.com with ESMTPS id 5a478bee46e88-385677c01dcsm2236417eec.20.2026.11.24.12.14.03
        for <brcm80211@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 24 Nov 2026 12:14:03 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-55d2c49c3d9so67258581cf.3
        for <brcm80211@lists.linux.dev>; Tue, 24 Nov 2026 12:14:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795551242; x=1796156042; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CtbqCWcplP8s8TS4XxS3H42+jZhVRK/WEZW5XIZ9ues=;
        b=ZXI3A6nEnAMCUczVrwQWRfjJrc2SMjIqEgQShwAeGkBr3yV/TO0XVGN+JeQeGmuw8T
         N9bEWARCtwwaZmqwfOYXt78Bo9hg9bzPFpedXLsvYKvIJ4Ggnn5EqaxnipCbdLfG9RqQ
         UmkyAXtjdRgP0udQrCN6/rKpN02bxSgXCJa1Q=
X-Forwarded-Encrypted: i=1; AL+hErH/cDzfEvxzAnO22ck75JQ/3JH6l7ksrHCyu2LzjqU8V3bI3y7eWXuMiX6tfSPoHbKQpY0uQUOt7NY=@lists.linux.dev
X-Received: by 2002:a05:622a:ea15:20b0:535:baa:a78d with SMTP id d75a77b69052e-55daab921bdmr54306161cf.10.1795551242417;
        Tue, 24 Nov 2026 12:14:02 -0800 (PST)
X-Received: by 2002:a05:622a:ea15:20b0:535:baa:a78d with SMTP id d75a77b69052e-55daab921bdmr54305701cf.10.1795551241893;
        Tue, 24 Nov 2026 12:14:01 -0800 (PST)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d7884d01csm136284651cf.21.2026.11.24.12.13.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 12:14:01 -0800 (PST)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: michael@amarulasolutions.com,
	linux-amarula@amarulasolutions.com,
	stable@vger.kernel.org,
	Abdun Nihaal <nihaal@cse.iitm.ac.in>,
	Benjamin Drung <benjamin.drung@canonical.com>,
	Fan Wu <fanwu01@zju.edu.cn>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Matthias Brugger <mbrugger@suse.com>,
	Runyu Xiao <runyu.xiao@seu.edu.cn>,
	brcm80211-dev-list.pdl@broadcom.com,
	brcm80211@lists.linux.dev,
	linux-wireless@vger.kernel.org,
	Arend van Spriel <arend.vanspriel@broadcom.com>
Subject: Re: [PATCH wireless] wifi: brcmfmac: fix use-after-free of the watchdog task_struct
Date: Tue, 24 Nov 2026 21:13:57 +0100
Message-ID: <20261124201357.3497730-1-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261120174231.2024897-1-dario.binacchi@amarulasolutions.com>
References: <20261120174231.2024897-1-dario.binacchi@amarulasolutions.com>
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Post: <mailto:brcm80211@lists.linux.dev>
List-Help: <mailto:brcm80211+help@lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
List-Owner: <mailto:brcm80211+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On Fri, 20 Nov 2026 18:42:27 +0100, Dario Binacchi <dario.binacchi@amarulasolutions.com> wrote:
> The watchdog thread exits as soon as it receives a SIGTERM, also from
> userspace, e.g. when init kills all the processes at reboot. If the
> driver is removed afterwards, the reference taken right before sending
> the signal by commit c623b6358088 ("wifi: brcmfmac: Fix potential
> use-after-free issue when stopping watchdog task") comes too late, and
> kthread_stop() runs on a task_struct already freed.

[...]

> Take the reference before the thread is started and drop it with
> kthread_stop_put() when it is stopped.
>
> Fixes: c623b6358088 ("wifi: brcmfmac: Fix potential use-after-free issue when stopping watchdog task")
> Cc: stable@vger.kernel.org
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> ---
>
>  .../net/wireless/broadcom/brcm80211/brcmfmac/sdio.c  | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)

Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>

Regards,
Arend
