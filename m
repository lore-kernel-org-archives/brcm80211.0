Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24D731B5804
	for <brcm80211@lists.linux.dev>; Tue,  2 Jul 2024 13:57:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719928649; cv=none; b=Nsa/1QplLwEYOgdhra+M4MMt8imakNNgFdX0E3BIwbzyVBSP/vRf9cUTUMaKzn9XmP1NQN2uGpygshQkdbdcksBI4eR+kMWw+YDbk/5HTvMAqHxnxcLyrgVp1AlmfsCuHzSh5Px3rd+ECQzgr3enu1vTgoJGL2rCIvNw/ftgEb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719928649; c=relaxed/simple;
	bh=qt01brAtBuYeYDb5XU6vCoxDmnQV+1+Sre8GzSkYpTs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y/rjK8j3CXG0jgQpKrS/99G9hjeBDM7o+en/+5PQQBO1VBqNiD9nQUKZ5Pn7M3tkFLPndGWn32UwdniFRq+rJ2aFOcr5R3d3rH1GQuyWSBYNZWOJUOL1YppcR4I7kOn0a5T0dJXbAjvG/jiSGUWKImgyBECHIaHzJKK3aEJdhck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sCeG7l5Q; arc=none smtp.client-ip=209.85.210.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sCeG7l5Q"
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-7021dd7ffebso803967a34.3
        for <brcm80211@lists.linux.dev>; Tue, 02 Jul 2024 06:57:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719928647; x=1720533447; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ePmiEYi/a4AH0wn7ckFFYm2PTW/+uVYsAN+yRliA3Bs=;
        b=sCeG7l5QKs6RPXZvkSU1jukVURVu/3qg6IQqkazBwPuzFUjA4sqTbwcGLfUMTcehR9
         f1htjftNkiIHCY00IR/Hcj8EjakB6gcDKvoXaAX08jNIau/lTjy1PC8IE6i7tf5XKw5k
         gCBKxXWpAdgykbzKY+z9Cf2coOdbSfDuUKoMB2W2i3SurhVr0f8nSujmjOmy0+3PxT4k
         kwdMtSKQxnO7bY9q1hniHbE7q30qieVP7+Tn8jV/3ayloxRAJutaRFxr55z5k39ucWFy
         YIGLKB7rKlP+paXYCHvJ8eQqJi+oFGpWQGymVsD6KcGDsWE+r/7aLUh3ZGeHFR+9MJpz
         iTOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719928647; x=1720533447;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ePmiEYi/a4AH0wn7ckFFYm2PTW/+uVYsAN+yRliA3Bs=;
        b=ouK0J3sWTjOWvMzpL4odSlefJqqBDSagAthPFRpKT+UyhGDA/1/4ALpKnhA9RWYsxn
         4AbJNoSZzXVbE5Xc9yuwJS4KqwWvo7HBo+85hYSlATUpgBFx1oDn9Aj9u2hTbqabhv4n
         AH24rEIvo330/cr5aXKZScMUfMp7LqmeoN9LAXc0YQoLYpesPsYK3dB6onJUv8lu2YgF
         JeqNG+dOmZWDVZ/WYc1NpbyjGzjlQs/8iu+by+ZdrLisR1y1hnP6vsgMM6TblHgmcruF
         ZJTO+5D1eZAULD+LGYfhT8s2DXXCOSHyLIhgtUrxraiPDicl4DQ79CBg6D4J4jIaMxwj
         Om4Q==
X-Forwarded-Encrypted: i=1; AJvYcCWlGpIfhJZrNiFtgZle5CBq59GPDx7s1LQeelEfXUBdb7FVc3PX99E/tOT3A4LJp5+e2eu/QX+Xfb7buQfIE6wcLeXfuCsihSr8
X-Gm-Message-State: AOJu0YyVIRaI+Ye/XjtEp4XdDHTCvEaxgq5uvJMCnznU6BJkYd0rudyW
	P7ly6epmFKUJHrkYCYIfOO8wgnBfB5NJCs9Vz1cqdAnfXpr3BHHp7jqJS7AbVlM=
X-Google-Smtp-Source: AGHT+IH5Vk/edmC8lLAXOlWnBYfSKbo/eOsXpv1FuEvdKG37AODsGoiz394zQKMr5V6bCT7B+XImXQ==
X-Received: by 2002:a9d:7c84:0:b0:700:cf6e:e261 with SMTP id 46e09a7af769-70207708212mr10589665a34.31.1719928647061;
        Tue, 02 Jul 2024 06:57:27 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:a6f1:b7be:4c8c:bf62])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-701f7ab6931sm1688615a34.31.2024.07.02.06.57.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jul 2024 06:57:26 -0700 (PDT)
Date: Tue, 2 Jul 2024 15:57:23 +0200
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Su Hui <suhui@nfschina.com>
Cc: arend.vanspriel@broadcom.com, kvalo@kernel.org, johannes.berg@intel.com,
	kees@kernel.org, a@bayrepo.ru, marcan@marcan.st,
	quic_alokad@quicinc.com, zyytlz.wz@163.com,
	petr.tesarik.ext@huawei.com, duoming@zju.edu.cn,
	colin.i.king@gmail.com, frankyl@broadcom.com, meuleman@broadcom.com,
	phaber@broadcom.com, linville@tuxdriver.com,
	linux-wireless@vger.kernel.org, brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH wireless 1/9]  wifi: cfg80211: avoid garbage value of
 'io_type' in  brcmf_cfg80211_attach()
Message-ID: <ba67020a-04bb-46b8-bc05-751684f71e8a@suswa.mountain>
References: <20240702122450.2213833-1-suhui@nfschina.com>
 <20240702122450.2213833-2-suhui@nfschina.com>
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240702122450.2213833-2-suhui@nfschina.com>

On Tue, Jul 02, 2024 at 08:24:44PM +0800, Su Hui wrote:
>  brcmf_fil_cmd_int_get() reads the value of 'io_type' and passes it to
>  brcmf_fil_cmd_data_get(). Initialize 'io_type' to avoid garbage value.

Since you're going to be resending anyway, please delete the space char
from the start of the line.

It's weird that brcmf_fil_cmd_data_get() uses the uninitialized data.
It looks like it just goes to great lengths to preserve the original
data in io_type...  So it likely is harmless enough but still a strange
and complicated way write a no-op.

regards,
dan carpenter

